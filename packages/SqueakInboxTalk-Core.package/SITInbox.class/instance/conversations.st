accessing
conversations

	^ self mailingList conversations collect: [:mailConversation | SITConversation on: mailConversation]