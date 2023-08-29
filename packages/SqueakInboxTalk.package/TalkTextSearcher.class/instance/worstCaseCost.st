cost planning
worstCaseCost

	self matchesExact ifTrue: [^ 40].
	self matchesWildcard ifTrue: [^ 49].
	self usesRegex ifTrue: [^ 57].
	^ self matchStrategy
		caseOf: {
			[#bitap] -> [43].
			[#levenshtein] -> [68].
			[#nGram] -> [22].
			[#soundex] -> [12]}
		otherwise: [super worstCaseCost]