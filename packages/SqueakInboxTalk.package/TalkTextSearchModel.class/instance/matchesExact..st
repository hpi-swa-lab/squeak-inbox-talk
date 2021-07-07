accessing - toolbuilder
matchesExact: aBoolean

	self doUpdate: [self searcher doMatchExact].
	self changed: #matchesExact