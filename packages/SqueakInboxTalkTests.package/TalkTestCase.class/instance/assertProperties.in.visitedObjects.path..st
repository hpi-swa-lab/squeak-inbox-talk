asserting - properties
assertProperties: expectedProperties in: actualObject visitedObjects: visitedObjects path: path

	expectedProperties keysAndValuesDo: [:key :expectedValue | self assertProperty: expectedValue in: (self getProperty: key fromObject: actualObject) visitedObjects:visitedObjects path: (path copyWith: key)]