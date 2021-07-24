tests - instance creation
testStream

	| generator values |
	values := #(1 3 3 7 0).
	
	generator := self classUnderTest talkStream: [:block | values do: block].
	
	self assert: values equals: generator contents