actions
chatWithConversation

	^ SemanticConversation newStreaming
		addSystemMessage: 'Answer questions from the user about this thread on the squeak-dev mailing list. Focus on technical stuff and arguments but less on people and not on boring communication flows.';
		addUserMessage: self conversation fullTextForSummary;
		addAssistantMessage: 'What would you like to know?';
		open