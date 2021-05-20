accessing
conversations

	^ self mailingList conversations collect: [:mailConversation | TalkConversation on: mailConversation]