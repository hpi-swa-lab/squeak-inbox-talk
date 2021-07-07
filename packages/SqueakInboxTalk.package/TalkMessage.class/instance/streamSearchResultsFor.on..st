searching
streamSearchResultsFor: aString on: aStream

	#(author date subject) do: [:propertyName | | propertyValue |
		propertyValue := (propertyName value: self) asString.
		(propertyValue includesSubstring: aString caseSensitive: false) ifTrue: [
			aStream nextPut: ('{1}: {2}' format: {propertyName capitalized. propertyValue})]].
	
	self text asString lines do: [:line |
		(line includesSubstring: aString caseSensitive: false)
			ifTrue: [aStream nextPut: line]].