test - squeak-protocol
testTalkPrettyPrintString

	| date |
	date := DateAndTime year: 2159 month: 3 day: 14 hour: 2 minute: 53 second: 59.
	
	self assert: '2159-03-14 02:53:59' equals: date talkPrettyPrintString