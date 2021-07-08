conversation gathering
gatherConversationsOn: aStream

	| newConversations filteredConversations |
	newConversations := Generator on: [:stream | stream nextPutAll: self allConversations].
	
	filteredConversations := self totalFilter filter: newConversations.
	
	aStream nextPutAll: filteredConversations