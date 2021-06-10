asserting - properties
assert: expectedValues equalProperties: actualValues visitedObjects: visitedObjects path: path

	| index |
	self assert: expectedValues size equals: actualValues size description: (path joinSeparatedBy: $/).
	
	index := 0.
	expectedValues with: actualValues do: [:expected :actual |
		self
			assertProperty: expected
			in: actual
			visitedObjects: visitedObjects
			path: (path copyWith: (index := index + 1))]