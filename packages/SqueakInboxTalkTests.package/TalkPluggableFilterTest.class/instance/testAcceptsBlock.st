tests
testAcceptsBlock

	| filter no yes |
	yes := self patchNewAt: #isZöglfrex withValue: true.
	no := self patchNewAt: #isZöglfrex withValue: false.
	
	filter := self classUnderTest new.
	
	self assert: (filter accepts: yes).
	self assert: (filter accepts: no).
	
	filter predicate: [:each | each isZöglfrex].
	
	self assert: (filter accepts: yes).
	self deny: (filter accepts: no)