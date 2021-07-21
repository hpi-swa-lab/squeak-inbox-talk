tests - filtering
testResetFilter

	| filter |
	filter := self classUnderTest new
		newTerm: 'foo';
		yourself.
	
	filter reset.
	
	self
		deny: filter isActive;
		assert: 0 equals: filter enabledOptionsCount