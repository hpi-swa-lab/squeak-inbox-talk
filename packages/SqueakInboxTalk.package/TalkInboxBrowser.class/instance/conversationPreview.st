accessing - state
conversationPreview

	conversationPreview ifNotNil: [^ conversationPreview].
	
	^ self simpleConversationPreview