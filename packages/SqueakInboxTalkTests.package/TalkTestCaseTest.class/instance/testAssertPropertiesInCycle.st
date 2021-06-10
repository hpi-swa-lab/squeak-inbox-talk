tests - asserting
testAssertPropertiesInCycle

	| expectedInner expectedOuter inner outer |
	inner := OrderedCollection new.
	outer := {inner}.
	inner
		add: outer;
		add: inner.
	
	expectedInner := OrderedCollection new.
	expectedOuter := Dictionary new
		at: #size put: 1;
		at: #yourself put: {inner};
		yourself.
	expectedInner := Dictionary new
		at: #size put: 2;
		at: #first put: expectedOuter;
		at: #yourself put: {expectedOuter. expectedInner};
		yourself.
	expectedInner at: #last put: expectedInner.
	
	self assertProperties: expectedOuter in: outer