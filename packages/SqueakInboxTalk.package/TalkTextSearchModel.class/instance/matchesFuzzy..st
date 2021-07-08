accessing - toolbuilder
matchesFuzzy: aBoolean

	aBoolean ifFalse: [^ self matchesExact: true].
	
	self doUpdate: [self searcher matchStrategy: self fuzzyMatchStrategy].
	self changed: #matchesFuzzy