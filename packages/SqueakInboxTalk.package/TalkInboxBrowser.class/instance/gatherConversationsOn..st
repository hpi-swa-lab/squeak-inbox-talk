conversation gathering
gatherConversationsOn: aStream

	| newConversations filteredConversations |
	aStream nextPutAll: self pendingAnnouncements.
	
	newConversations := self allConversations readStream.
	
	filteredConversations := self totalFilter filter: newConversations.
	
	aStream nextPutAll: filteredConversations