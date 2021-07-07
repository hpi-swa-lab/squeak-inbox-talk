searching
streamSearchResultsFor: aString on: aStream

	self flag: #todo.
	"fuzzy matching"
	(self subject includesSubstring: aString caseSensitive: false) ifTrue: [aStream nextPut: self subject].
	
	self messages do: [:message | message streamSearchResultsFor: aString on: aStream].
	self contributions do: [:contribution | contribution streamSearchResultsFor: aString on: aStream]