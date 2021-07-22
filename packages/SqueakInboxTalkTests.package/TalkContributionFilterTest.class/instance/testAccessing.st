tests
testAccessing

	| filter |
	filter := self classUnderTest new.
	self
		assert: filter withContributions;
		assert: filter withoutContributions.
	self
		deny: filter isActive;
		assert: 0 equals: filter enabledOptionsCount.
	
	filter withContributions: false.
	self
		deny: filter withContributions;
		assert: filter withoutContributions.
	self
		assert: filter isActive;
		assert: 1 equals: filter enabledOptionsCount.
	
	filter withoutContributions: false.
	self
		assert: filter withContributions;
		assert: filter withoutContributions.
	self
		deny: filter isActive;
		assert: 0 equals: filter enabledOptionsCount.
	
	filter withoutContributions: false.
	self
		assert: filter withContributions;
		deny: filter withoutContributions.
	self
		assert: filter isActive;
		assert: 1 equals: filter enabledOptionsCount