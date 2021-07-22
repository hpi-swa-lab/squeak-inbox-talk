tests
testAccessing

	| filter |
	filter := self classUnderTest new.
	#(#author #mentioned #participated #newReplies) do: [:state | self deny: (filter hasInvolvement: state)].
	self
		deny: filter isActive;
		assert: 0 equals: filter enabledOptionsCount.
	
	filter setInvolvement: #mentioned to: true.
	self assert: (filter hasInvolvement: #mentioned).
	#(#author #participated #newReplies) do: [:state | self deny: (filter hasInvolvement: state)].
	self
		assert: filter isActive;
		assert: 1 equals: filter enabledOptionsCount.
	
	filter setInvolvement: #participated to: true.
	#(#mentioned #participated) do: [:state | self assert: (filter hasInvolvement: state)].
	#(#author #newReplies) do: [:state | self deny: (filter hasInvolvement: state)].
	self
		assert: filter isActive;
		assert: 2 equals: filter enabledOptionsCount