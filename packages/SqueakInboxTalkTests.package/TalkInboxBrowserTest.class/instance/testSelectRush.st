tests
testSelectRush

	#(1 2 3) do: [:index |
		browser selectedConversationIndex: index.
		self assert: browser selectedConversation notNil].
	
	self waitWhileBusy.
	self assert: (browser conversations at: 3) equals: browser selectedConversation