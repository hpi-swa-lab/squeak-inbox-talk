tests
testAccepts

	| nothing pending merged filter |
	nothing := self patchNewAt: #hasContributions withValue: false.
	pending := self
		patch: (self patchNewAt: #hasContributions withValue: true)
		at: #contributionState
		withValue: #pending.
	merged := self
		patch: (self patchNewAt: #hasContributions withValue: true)
		at: #contributionState
		withValue: #merged.
	
	filter := self classUnderTest new.
	
	self assert: (filter accepts: nothing).
	self assert: (filter accepts: pending).
	self assert: (filter accepts: merged).
	
	filter setState: #merged to: false.
	
	self assert: (filter accepts: nothing).
	self assert: (filter accepts: pending).
	self deny: (filter accepts: merged)