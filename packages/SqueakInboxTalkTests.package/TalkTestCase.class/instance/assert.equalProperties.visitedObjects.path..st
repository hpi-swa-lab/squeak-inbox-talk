asserting - properties
assert: expectedValues equalProperties: actualValues visitedObjects: visitedObjects path: path

	| index |
	expectedValues isSequenceable ifFalse: [ | sortFunction |
		sortFunction := [:a :b | (a compareSafely: b) ifTrue: [-1] ifFalse: [1]] asSortFunction.
		^ self assert: (expectedValues sorted: sortFunction) equalProperties: (actualValues sorted: sortFunction) visitedObjects: visitedObjects path: path].
	
	self assert: expectedValues size equals: actualValues size description: (path joinSeparatedBy: $/).
	
	index := 0.
	expectedValues with: actualValues do: [:expected :actual |
		self
			assertProperty: expected
			in: actual
			visitedObjects: visitedObjects
			path: (path copyWith: (index := index + 1))]