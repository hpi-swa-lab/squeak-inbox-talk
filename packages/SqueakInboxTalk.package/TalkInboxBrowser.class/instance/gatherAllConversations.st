conversation gathering
gatherAllConversations

	Project uiManager informUser: 'Scanning conversations...' during: [ | newConversations |
		newConversations := self inbox mostRecentConversations.
		self numberOfConversations ifNotNil: [:limit | newConversations := newConversations first: limit].
		
		newConversations := self combineContributionConversations: newConversations.
		
		^ newConversations]