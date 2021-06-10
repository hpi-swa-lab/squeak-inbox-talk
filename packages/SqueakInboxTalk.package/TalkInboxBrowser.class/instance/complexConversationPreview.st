accessing - state
complexConversationPreview

	^ conversationPreview ifNil: [conversationPreview := self buildComplexConversationPreview]