accessing
conversations

	^ conversations ifNil: [ | allConversations |
		"cached"
		Project uiManager
			informUser: 'Please be patient, optimization is yet to be done...'
			during: [
				allConversations := self inbox mostRecentConversations.
				allConversations := allConversations take: self numberOfConversations.
				self showingNonContributions ifFalse: [allConversations := allConversations select: [:conversation | conversation hasContributions]].
				allConversations := allConversations reject: [:conversation | conversation hasContributions and: [conversation contributions allSatisfy: [:contribution | contribution conversations anySatisfy: [:otherConversation | otherConversation ~= conversation and: [otherConversation latestDate > conversation latestDate]]]]]].
		conversations := allConversations]