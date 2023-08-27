private
semanticConversationConfig

	^ ConversationConfig ifNil: [ConversationConfig :=
		SemanticConversationConfig newStreaming]