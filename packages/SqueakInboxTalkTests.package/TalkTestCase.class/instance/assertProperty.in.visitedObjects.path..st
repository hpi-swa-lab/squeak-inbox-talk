asserting - properties
assertProperty: expectedProperty in: actualObject visitedObjects: visitedObjects path: path

	(visitedObjects ifAbsentAdd: actualObject) ifFalse: [^ self].
	
	expectedProperty isDictionary ifTrue: [^ self assertProperties: expectedProperty in: actualObject visitedObjects: visitedObjects path: path].
	(expectedProperty isCollection and: [expectedProperty isString not]) ifTrue: [^ self assert: expectedProperty equalProperties: actualObject visitedObjects: visitedObjects path: path].
	
	^ self assert: expectedProperty equals: actualObject description: (path joinSeparatedBy: $/)