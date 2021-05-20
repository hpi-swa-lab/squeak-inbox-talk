accessing
conversation: aConversation

	conversation := aConversation.
	self changed: #conversation.
	
	self selectedMessage: self messages first