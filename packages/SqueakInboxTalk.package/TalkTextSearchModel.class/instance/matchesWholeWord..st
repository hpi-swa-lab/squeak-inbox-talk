accessing - searcher
matchesWholeWord: aBoolean

	self doUpdate: [self searcher matchesWholeWord: aBoolean].
	self changed: #matchesWholeWord