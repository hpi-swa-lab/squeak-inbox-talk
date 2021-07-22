tests
testAccepts

	| bar foo1 mega nothing |
	nothing := self patchNewAt: #contributions withValue: #().
	foo1 := self patchNewAt: #contributions withValue: {contributionFoo1}.
	bar := self patchNewAt: #contributions withValue: {contributionBar}.
	mega := self patchNewAt: #contributions withValue: {contributionFoo2. contributionBar}.
	
	self assert: (filter accepts: nothing).
	self assert: (filter accepts: foo1).
	self assert: (filter accepts: bar).
	self assert: (filter accepts: mega).
	
	filter items: #('Foo' 'Baz').
	
	self deny: (filter accepts: nothing).
	self assert: (filter accepts: foo1).
	self deny: (filter accepts: bar).
	self assert: (filter accepts: mega)