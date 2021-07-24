search results
resultsFromMatches: originalMatches withAttributes: matchAttributes
	"Answer a collection of contiguous text excerpts containing all of the passed originalMatches, with the matched strings in the text emphasized by the passed matchAttributes. The returned collection is an OrderedDictionary which's key are the original matches."

	| matches |
	matches := originalMatches sorted: #start ascending.
	
	matches := matches collect: [:match | match withSurroundingLines: self numberOfSurroundingLines].
	
	matches := matches
		talkGroupBy: [:match | {match object. match key}]
		thenGather: [:group | self mergeOverlappingMatches: group].
	
	matches := self removeRedundantLabelsFromMatches: matches.
	
	^ matches contents
		collect: [:match | match -> (match matchTextWithAttributes: matchAttributes)]
		as: OrderedDictionary