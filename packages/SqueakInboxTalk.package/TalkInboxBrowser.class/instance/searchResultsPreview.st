accessing - contents
searchResultsPreview

	| matches results |
	self hasConversationSelected ifFalse: [^ self simpleContents].
	
	matches := (searchModel safeMatchesIn: self selectedConversation) take: 50.
	matches := matches copyWithFirst: self selectedConversation previewMatch.
	
	results := searchModel annotatedResultsFromMatches: matches.
	results := results associations collect: [:assoc |
		'{1} ({2})' asText format: {
			assoc value.
			'read on' asText addAttribute: (PluggableTextAttribute evalBlock: [
				"text"
				self withSearcherBrowse: assoc key object
				"match"])}].
	
	"Join results (#joinSeparatedBy: ignores styling)"
	^ (results ifEmpty: [^ '']) reduce: [:first :second | first, '\\' withCRs, second]