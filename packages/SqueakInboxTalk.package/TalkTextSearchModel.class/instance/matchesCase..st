accessing - searcher
matchesCase: aBoolean

	self doUpdate: [self searcher matchesCase: aBoolean].
	self changed: #matchesCase