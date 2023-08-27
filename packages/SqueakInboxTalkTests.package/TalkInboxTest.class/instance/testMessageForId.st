tests
testMessageForId

	| inbox message |
	inbox := self classUnderTest new.
	message := self patch: Object new at: #messageId withValue: 42.
	self patch: inbox at: #messages withValue: {message}.
	
	self assert: message equals: (inbox messageForId: 42).