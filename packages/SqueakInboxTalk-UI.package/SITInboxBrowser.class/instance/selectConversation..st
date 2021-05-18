accessing - state
selectConversation: aConversation 

	selectedConversation := aConversation.
	self changed: #selectedConversation.