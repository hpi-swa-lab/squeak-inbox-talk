actions
browseContribution

	^ (self selectedConversation ifNil: [^ self]) contributions do: #browse