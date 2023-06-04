accessing - state
messageFormat: aSymbol

	messageFormat := aSymbol.
	
	self searchModel messageTextSelector: self messageFormat.
	
	self changed: #messageFormat.