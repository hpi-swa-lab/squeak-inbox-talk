conversation gathering
gatherConversations

	^ Array streamContents: [:stream |
		self gatherConversationsOn: stream]