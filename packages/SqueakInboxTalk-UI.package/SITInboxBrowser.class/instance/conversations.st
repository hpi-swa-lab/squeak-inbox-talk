accessing
conversations

	^ conversations ifNil: [ | allConversations |
		"cached"
		Project uiManager informUser: 'Scanning conversations...' during: [
			allConversations := self inbox mostRecentConversations.
			self numberOfConversations ifNotNil: [:limit | allConversations := allConversations first: limit].
			self showingNonContributions ifFalse: [allConversations := allConversations select: [:conversation | conversation hasContributions]].
			allConversations := allConversations reject: [:conversation | conversation hasContributions and: [conversation contributions allSatisfy: [:contribution | contribution conversations anySatisfy: [:otherConversation | otherConversation ~= conversation and: [otherConversation latestDate > conversation latestDate]]]]]].
		conversations := allConversations]