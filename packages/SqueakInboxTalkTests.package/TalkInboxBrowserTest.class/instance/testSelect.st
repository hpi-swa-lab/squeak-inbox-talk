tests
testSelect

	browser selectedConversationIndex: 1.
	self assert: browser selectedConversation notNil.
	
	self waitWhileBusy.
	self assert: (browser contents asString includesSubstring: (browser selectedConversation text asString first: 100))