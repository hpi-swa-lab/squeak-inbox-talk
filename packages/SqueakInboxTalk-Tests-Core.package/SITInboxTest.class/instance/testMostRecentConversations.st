tests
testMostRecentConversations

	| dates inbox |
	inbox := self classUnderTest new.
	dates := #(2 4 3 1) collect: [:date | self patch: Object new at: #latestDate toValue: date].
	self patch: inbox at: #conversations to: [dates].
	
	self assert: (dates sorted: #latestDate descending) equals: inbox mostRecentConversations