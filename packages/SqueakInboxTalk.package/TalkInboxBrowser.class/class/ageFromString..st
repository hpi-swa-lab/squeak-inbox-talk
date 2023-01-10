preferences - private
ageFromString: aString

	| duration |
	aString ifEmpty: [^ nil].
	
	[^ Duration fromString: aString] ifError: [].
	
	duration := Object readFrom: aString.
	duration = 0 ifTrue: [duration := duration hours].
	(duration isNil or: [duration isKindOf: Duration])
		ifFalse: [self error: 'invalid duration'].
	^ duration