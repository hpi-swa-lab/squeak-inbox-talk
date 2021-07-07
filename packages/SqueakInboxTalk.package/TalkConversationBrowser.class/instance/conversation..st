accessing
conversation: aConversation

	conversation := aConversation.
	self changed: #conversation.
	
	self selectMessage: self messages first