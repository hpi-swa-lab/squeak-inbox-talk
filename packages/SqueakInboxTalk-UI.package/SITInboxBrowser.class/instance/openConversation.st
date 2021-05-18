actions
openConversation

	self flag: #todo. "Join multiple conversations in one window"
	(self selectedConversation ifNil: [^ self]) contributions
		ifEmpty: [self selectedConversation browse]
		ifNotEmpty: [:contributions | (contributions gather: #conversations) do: #browse].