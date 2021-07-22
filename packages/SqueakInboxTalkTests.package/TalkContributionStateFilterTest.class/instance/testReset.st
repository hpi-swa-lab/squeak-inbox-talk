tests
testReset

	| filter |
	filter := self classUnderTest new
		setState: #pending to: false;
		yourself.
	
	filter reset.
	
	#(#pending #merged #treated) do: [:state | self assert: (filter hasState: state)].
	self
		deny: filter isActive;
		assert: 0 equals: filter enabledOptionsCount