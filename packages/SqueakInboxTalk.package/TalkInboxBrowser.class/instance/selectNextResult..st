actions
selectNextResult: forward

	| index results |
	results := self conversations ifEmpty: [^ false].
	index := self selectedConversationIndex.
	index := forward ifTrue: [index + 1] ifFalse: [index = 0 ifFalse: [index - 1] ifTrue: [0]].
	self selectConversation: (results atWrap: index)