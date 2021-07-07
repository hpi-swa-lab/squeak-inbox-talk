accessing - contents
searchResultsPreview

	| matches results |
	self hasConversationSelected ifFalse: [^ self simpleContents].
	
	matches := (searchModel safeMatchesInConversation: self selectedConversation) take: 50.
	matches := matches copyWithFirst: self selectedConversation previewMatch.
	
	results := searchModel annotatedResultsFromMatches: matches.
	results := results associations collect: [:assoc |
		'{1} ({2})' asText format: {
			assoc value.
			'read on' asText addAttribute: (PluggableTextAttribute evalBlock: [
				"text"
				assoc key object browseForSearcher: searchModel copySearcher
				"match"])}].
	
	"Join results (#joinSeparatedBy: ignores styling)"
	^ (results ifEmpty: [^ '']) reduce: [:first :second | first, '\\' withCRs, second]