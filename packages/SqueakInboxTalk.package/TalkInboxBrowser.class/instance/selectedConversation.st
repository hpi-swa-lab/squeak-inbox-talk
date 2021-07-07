accessing - state
selectedConversation

	selectedConversation = #searching ifTrue: [^ nil].
	^ selectedConversation