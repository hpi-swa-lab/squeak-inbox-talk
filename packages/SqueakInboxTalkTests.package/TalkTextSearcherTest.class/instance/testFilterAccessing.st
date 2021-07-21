tests
testFilterAccessing

	| filter |
	filter := self classUnderTest new.
	self assert: filter term isNil.
	self
		deny: filter isActive;
		assert: 0 equals: filter enabledOptionsCount.
	
	filter newTerm: 'foo'.
	self
		assert: filter isActive;
		assert: 1 equals: filter enabledOptionsCount.
	self assert: 'foo' equals: filter term