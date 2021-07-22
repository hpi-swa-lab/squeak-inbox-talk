tests
testHasMailAddress

	| person |
	person := self classUnderTest new.
	
	person mailAddresses: #('a.b@c.com' 'foo-bar@example.com').
	
	self assert: (person hasMailAddress: 'foo-bar@example.com').
	self assert: (person hasMailAddress: 'A.B@c.com').
	self deny: (person hasMailAddress: 'a.b@d.com')