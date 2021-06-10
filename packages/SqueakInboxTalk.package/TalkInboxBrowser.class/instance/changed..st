updating
changed: aspect

	aspect
		caseOf: {
			[#conversations] -> [(self conversations includes: self selectedConversation) ifFalse: [self selectConversation: nil]].
			[#conversationPreview] -> [
				self
					backgroundWorkerFor: #conversationPreview
					do: [self complexConversationPreview]
					thenDo: [self changed: #conversationPreview]]}
		otherwise: [].
	
	^ super changed: aspect