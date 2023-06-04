tests
testExplainTimezone

	| message text |
	message := self classUnderTest new.
	
	self
		patch: message at: #date withValue: (DateAndTime fromString: '2023-06-04T00:53:27-07:00');
		patch: TimeZone at: #local with: [TimeZone timeZones detect: [:tz | tz abbreviation = 'EST']];
		patch: DateAndTime at: #localOffset withValue: -5 hours.
	
	text := [message explainTimezone]
		on: ProvideAnswerNotification
		do: [:ex | ex messageText].
	
	self assert: 'In their timezone (MST/PDT): 2023-06-04T00:53:27-07:00
In our timezone (EST): 2023-06-04T02:53:27-05:00' equals: text.