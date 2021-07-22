actions
openConversation

	self browse: (self selectedConversation ifNil: [^ self])