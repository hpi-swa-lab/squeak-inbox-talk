tests
testAccessing

	self assert: filter items isEmpty.
	self
		deny: filter isActive;
		assert: 0 equals: filter enabledOptionsCount.
	
	filter items: #('Foo').
	self
		assert: filter isActive;
		assert: 1 equals: filter enabledOptionsCount.
	
	filter items: #('Foo' 'Baz').
	self
		assert: filter isActive;
		assert: 2 equals: filter enabledOptionsCount.
	
	filter items: #().
	self
		deny: filter isActive;
		assert: 0 equals: filter enabledOptionsCount