actions
browseContributions

	^ (self selectedConversation ifNil: [^ self]) browseContributions