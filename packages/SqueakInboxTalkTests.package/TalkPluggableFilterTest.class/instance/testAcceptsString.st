tests
testAcceptsString

	| filter no yes |
	yes := self patchNewAt: #hasPlonk withValue: true.
	no := self patchNewAt: #hasPlonk withValue: false.
	
	filter := self classUnderTest new.
	filter inbox: (self patchNewAt: #hasPlonk: with: [:thisInbox :conversation | conversation hasPlonk]).
	
	self assert: (filter accepts: yes).
	self assert: (filter accepts: no).
	
	filter compilePredicate: 'self hasPlonk: each'.
	
	self assert: (filter accepts: yes).
	self deny: (filter accepts: no)