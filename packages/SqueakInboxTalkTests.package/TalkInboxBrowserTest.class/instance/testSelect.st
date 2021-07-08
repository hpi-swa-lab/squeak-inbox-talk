tests
testSelect

	browser selectedConversationIndex: 1.
	self assert: browser selectedConversation notNil.
	
	self waitWhileBusy.
	self assert: ({browser selectedConversation text. (browser selectedConversation contributions at: 1 ifAbsent: []) ifNotNil: #messageText} anySatisfy: [:text | browser contents asString includesSubstring: (text asString lines first take: 100)]).