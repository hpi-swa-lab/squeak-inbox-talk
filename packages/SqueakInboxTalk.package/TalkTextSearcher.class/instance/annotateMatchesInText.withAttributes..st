search results
annotateMatchesInText: aStringOrText withAttributes: matchAttributes

	| text matches |
	self isActive ifFalse: [^ aStringOrText].
	
	text := aStringOrText asText copy.
	matches := self matchesInText: text.
	
	matches do: [:match | match annotateText: text withAttributes: matchAttributes].
	
	^ text