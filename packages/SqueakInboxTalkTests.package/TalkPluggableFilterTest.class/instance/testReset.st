tests
testReset

	| filter |
	filter := self classUnderTest new
		predicate: [:each | each hasPlonk];
		yourself.
	
	filter reset.
	
	self
		deny: filter isActive;
		assert: 0 equals: filter enabledOptionsCount