searching
annotateMatchesIn: aStringOrText withAttributes: matchAttributes

	| text matches |
	self isActive ifFalse: [^ aStringOrText].
	
	text := aStringOrText asText copy.
	matches := self matchesIn: text.
	
	matches do: [:match | match annotateText: text withAttributes: matchAttributes].
	
	^ text