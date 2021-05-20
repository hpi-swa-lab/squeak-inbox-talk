tests
testPrintString

	| message |
	message := self classUnderTest new.
	self patch: message at: #subject withValue: 'foo bar'.
	
	self assert: ('a {1} (''foo bar'')' format: {self classUnderTest name}) equals: message printString