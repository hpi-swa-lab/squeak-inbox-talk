tests
testAccessing

	| filter |
	filter := self classUnderTest new.
	#(#pending #merged #treated) do: [:state | self assert: (filter hasState: state)].
	self
		deny: filter isActive;
		assert: 0 equals: filter enabledOptionsCount.
	
	filter setState: #treated to: false.
	self
		assert: filter isActive;
		assert: 1 equals: filter enabledOptionsCount.
	self
		assert: (filter hasState: #pending);
		assert: (filter hasState: #merged);
		deny: (filter hasState: #treated).
	
	filter setState: #merged to: false.
	self
		assert: filter isActive;
		assert: 2 equals: filter enabledOptionsCount.
	self
		assert: (filter hasState: #pending);
		deny: (filter hasState: #merged);
		deny: (filter hasState: #treated)