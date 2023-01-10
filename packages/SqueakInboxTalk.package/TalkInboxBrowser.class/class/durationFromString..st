preferences - private
durationFromString: aString

	| duration |
	aString ifEmpty: [^ nil].
	
	[^ Duration fromString: aString] ifError: [].
	
	duration := Object readFrom: aString.
	(duration isNil or: [duration isKindOf: Duration])
		ifFalse: [self error: 'invalid duration'].
	^ duration