accessing - toolbuilder
matchStrategyAbbreviation

	self searcher matchesWildcard ifTrue: [^ '*'].
	self searcher usesRegex ifTrue: [^ '.*'].
	self searcher matchesFuzzy ifTrue: [^ '~'].
	^ '...'