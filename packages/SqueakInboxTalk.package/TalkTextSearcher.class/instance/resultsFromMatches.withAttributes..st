searching
resultsFromMatches: originalMatches withAttributes: matchAttributes

	| matches |
	matches := originalMatches collect: [:match | match withSurroundingLines: self numberOfSurroundingLines].
	
	matches := matches
		talkGroupBy: [:match | {match object. match key}]
		thenGather: [:group | self mergeOverlappingMatches: group].
	
	matches := self removeRedundantLabelsFromMatches: matches.
	
	^ matches contents
		collect: [:match | match -> (match matchTextWithAttributes: matchAttributes)]
		as: OrderedDictionary