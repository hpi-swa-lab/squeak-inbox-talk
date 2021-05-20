contribution parsing
findProjectNamed: aString

	((#('The Trunk' 'The Inbox' 'Spur') includes: aString) or: [aString matchesRegex: 'Squeak \d+\.\d+']) ifTrue: [^ SITProject trunk].
	(#('FFI' 'FFI Inbox') includes: aString) ifTrue: [^ SITProject ffi].
	^ aString caseError