accessing - toolbuilder
matchStrategyLabel

	searcher usesRegex ifTrue: [^ 'regex'].
	searcher matchesFuzzy ifTrue: [^ 'fuzzy matching'].
	^ 'exact search'