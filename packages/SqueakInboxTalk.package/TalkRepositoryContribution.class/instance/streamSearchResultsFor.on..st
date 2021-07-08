searching
streamSearchResultsFor: aString on: aStream

	self flag: #todo.
	"Search summary? Would require better caching."
	(self versionName includesSubstring: aString caseSensitive: false) ifTrue: [aStream nextPut: self versionName]