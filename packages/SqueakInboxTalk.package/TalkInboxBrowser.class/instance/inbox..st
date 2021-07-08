accessing
inbox: anInbox

	inbox := anInbox.
	self totalFilter inbox: anInbox.
	
	self changed: #inbox.
	
	self selectConversation: nil