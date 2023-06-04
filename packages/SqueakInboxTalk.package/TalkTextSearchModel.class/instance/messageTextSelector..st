accessing - searcher
messageTextSelector: aSymbol

	self doUpdate: [self searcher messageTextSelector: aSymbol].
	self changed: #messageTextSelector.