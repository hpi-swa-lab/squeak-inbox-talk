conversation gathering
gatherConversationsOn: aStream

	| newConversations filteredConversations |
	newConversations := self allConversations readStream.
	
	filteredConversations := self totalFilter filter: newConversations.
	
	aStream nextPutAll: filteredConversations