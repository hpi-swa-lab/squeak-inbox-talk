functions
searchExact: exactTerms semantic: semanticTerms
	"Search the squeak-dev mailing list for the specified search terms.
	
	self new searchExact: #('asCommaString') semantic: #('Collection>>asCommaString deprecated' 'should not use asCommaString because semantics are unclear' 'rename #asCommaString to #joinWithCommas')
	"
	<function: search
		"Search the squeak-dev mailing list for the specified search terms.
		Exact search terms MUST be contained in each results, while semantic search terms are used for semantic search and contextual filtering. Use exact terms for names and identifiers and semantic search terms for broader context, including hypothetical documents.
		Example: exactSearchTerms = [""asCommaString""], semanticSearchTerms = [""Collection>>asCommaString deprecated"", ""should not use asCommaString because semantics are unclear"", ""rename #asCommaString to #joinWithCommas""
		Do not include generic search terms such as ""squeak"" or ""smalltalk"".]"
		(
			exactSearchTerms: {
				"type": "array",
				"items": {
					"type": "string"
				}
			},
			semanticSearchTerms: {
				"type": "array",
				"items": {
					"type": "string"
				}
			}
		)
	>

	| results searchers semanticResults sum |
	"Search in two stages: 1) semantic search based on semantic AND exact terms, 2) refinement with lexical search. This is because we still have no lexical inverted text index and searching the entire list would be way too slow. Works pretty reasonable unless for rare terms, though."
	searchers := exactTerms collect: [:term | TalkTextSearcher new
		newTerm: term;
		yourself].
	
	semanticResults := (exactTerms , semanticTerms) collect: [:term |
		self inbox semanticCorpus findRankedObjects: 1000 similarToQuery: term collect: #conversation].
	
	"sum := semanticResults sum."
	sum := Dictionary new.
	semanticResults do: [:ea |
		ea keysAndValuesDo: [:k :v | sum at: k put: (sum at: k ifAbsent: [0]) + v]].
	sum := (sum withValuesSorted: #yourself descending) keys.
	
	results := (searchers gather: [:searcher | searcher filter: sum]) withoutDuplicates.
	
	^ (results collect: [:conversation |
		JsonObject new
			subject: (conversation simpleSubject truncateWithEllipsisTo: 80);
			preview: conversation previewMatch basicMatchText;
			id: (self idForConversation: conversation);
			yourself])
				asJsonString