accessing - state
selectedConversationIndex: anInteger

	self selectConversation: (anInteger isZero ifFalse: [self conversations at: anInteger]).