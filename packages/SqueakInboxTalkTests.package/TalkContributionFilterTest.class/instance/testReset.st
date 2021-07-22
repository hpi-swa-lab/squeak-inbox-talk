tests
testReset

	| filter |
	filter := self classUnderTest new
		withContributions: false;
		yourself.
	
	filter reset.
	
	self
		assert: filter withContributions;
		assert: filter withoutContributions.
	self
		deny: filter isActive;
		assert: 0 equals: filter enabledOptionsCount