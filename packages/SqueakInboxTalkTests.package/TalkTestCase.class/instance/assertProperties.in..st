asserting - properties
assertProperties: expectedProperties in: actualObject
	"Assert that actualObject contains all of the expectedProperties with the associated values. Property keys can be getter selectors or evaluables such as blocks. Example:
	
	TalkTestCase new
		assertProperties: (OrderedDictionary new
			at: #x put: 3;
			at: #r put: 5;
			at: [:point | point \\ 2] put: 1 @ 0;
			yourself)
		in: 3 @ 4"

	^ self assertProperties: expectedProperties in: actualObject visitedObjects: IdentitySet new path: #()