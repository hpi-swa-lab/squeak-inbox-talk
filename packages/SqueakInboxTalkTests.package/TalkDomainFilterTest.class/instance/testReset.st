tests
testReset

	filter items: #('Foo' 'Baz').
	
	filter reset.
	
	self assert: filter items isEmpty.
	self
		deny: filter isActive;
		assert: 0 equals: filter enabledOptionsCount