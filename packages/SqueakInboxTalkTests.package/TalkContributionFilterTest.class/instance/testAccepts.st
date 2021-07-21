tests
testAccepts

	| filter withContribution withoutContribution |
	withContribution := self patchNewAt: #hasContributions withValue: true.
	withoutContribution := self patchNewAt: #hasContributions withValue: false.
	
	filter := self classUnderTest new.
	filter withoutContributions: false.
	
	self assert: (filter accepts: withContribution).
	self deny: (filter accepts: withoutContribution).
	
	filter := self classUnderTest new.
	filter withContributions: false.
	
	self deny: (filter accepts: withContribution).
	self assert: (filter accepts: withoutContribution)