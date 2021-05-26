actions
updateMessages

	Project uiManager
		informUser: 'Updating messages...'
		during: [self inbox updateMessages].
	
	conversations := nil.
	self changed: #conversations