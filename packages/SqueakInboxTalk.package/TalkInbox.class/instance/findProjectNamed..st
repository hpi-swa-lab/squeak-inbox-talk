contribution parsing
findProjectNamed: aString

	((#('The Trunk' 'The Inbox' 'Spur') includes: aString) or: [aString matchesRegex: 'Squeak \d+\.\d+']) ifTrue: [^ TalkProject trunk].
	(#('FFI' 'FFI Inbox') includes: aString) ifTrue: [^ TalkProject ffi].
	^ aString caseError