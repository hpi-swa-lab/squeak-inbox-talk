conversation gathering
combineContributionConversations: conversations
	"Combine all conversations that relate to the same contribution."

	^ conversations reject: [:conversation | conversation hasContributions and: [conversation contributions allSatisfy: [:contribution | contribution conversations anySatisfy: [:otherConversation | otherConversation ~= conversation and: [otherConversation latestDate > conversation latestDate]]]]]