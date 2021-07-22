tests
testReset

	| filter |
	filter := self classUnderTest new
		setInvolvement: #author to: true;
		setInvolvement: #newReplies to: true;
		yourself.
	
	filter reset.
	
	#(#author #mentioned #participated #newReplies) do: [:state | self deny: (filter hasInvolvement: state)].
	self
		deny: filter isActive;
		assert: 0 equals: filter enabledOptionsCount