actions
refreshMessages

	Project uiManager
		informUser: 'Refreshing messages...'
		during: [self inbox refreshMessages].
	
	allConversations := nil.
	self changed: #allConversations