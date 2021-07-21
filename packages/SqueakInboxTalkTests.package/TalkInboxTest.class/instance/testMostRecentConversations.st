tests
testMostRecentConversations

	| dates inbox |
	inbox := self classUnderTest new.
	dates := #(2 4 3 1) collect: [:date | self patchNewAt: #latestDate withValue: date].
	self patch: inbox at: #conversations withValue: dates.
	
	self assert: (dates sorted: #latestDate descending) equals: inbox mostRecentConversations