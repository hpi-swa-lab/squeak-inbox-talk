tests - converting
testAsGenerator

	| collection generator |
	collection := #(1 4 4 7 0).
	
	generator := collection talkAsGenerator.
	
	self assert: collection equals: generator contents