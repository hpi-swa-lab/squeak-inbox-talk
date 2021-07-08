accessing - toolbuilder
matchStrategyAbbreviation

	self searcher usesRegex ifTrue: [^ '.*'].
	self searcher matchesFuzzy ifTrue: [^ '~'].
	^ '...'