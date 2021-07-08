accessing
allConversations

	^ allConversations ifNil: [allConversations := self gatherAllConversations]