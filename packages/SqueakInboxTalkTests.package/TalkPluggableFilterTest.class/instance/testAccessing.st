tests
testAccessing

	| filter |
	filter := self classUnderTest new.
	self assert: filter predicate isNil.
	self
		deny: filter isActive;
		assert: 0 equals: filter enabledOptionsCount.
	
	filter compilePredicate: 'each hasPlonk'.
	self
		assert: filter isActive;
		assert: 1 equals: filter enabledOptionsCount.
	self assert: 'each hasPlonk' equals: filter predicateString.
	
	filter predicate: [:conversation | conversation isZöglfrex].
	self assert: (filter predicateString includesSubstring: 'isZöglfrex').
	self assert: 'each hasPlonk' equals: filter defaultPredicateString.
	self
		assert: filter isActive;
		assert: 1 equals: filter enabledOptionsCount