searching
streamSearchResultsFor: aString on: aStream

	self flag: #todo.
	"Search source code? Would require better caching."
	self summary asString lines do: [:line | (line includesSubstring: aString caseSensitive: false) ifTrue: [aStream nextPut: line]]