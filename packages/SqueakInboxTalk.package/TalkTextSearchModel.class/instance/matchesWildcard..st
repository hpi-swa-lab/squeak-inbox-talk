accessing - toolbuilder
matchesWildcard: aBoolean

	self doUpdate: [self searcher doMatchWildcard].
	self changed: #matchesWildcard