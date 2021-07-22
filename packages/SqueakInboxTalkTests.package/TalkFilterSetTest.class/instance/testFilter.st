tests
testFilter

	| off |
	self patch: foo at: #worstCaseCost withValue: 90.
	self patch: bar at: #worstCaseCost withValue: 10.
	self patch: foo at: #accepts: with: [:this :each |
		self assert: (self testBar: each) description: 'cheaper filter should have been tested first'.
		self testFoo: each].
	
	off := self patch: TalkFilter basicNew at: #isActive withValue: false.
	self patch: off at: #accepts with: [self fail: 'inactive filter has been invoked'].
	
	filter filters: {foo. off. bar}.
	
	self
		assert: (conversations select: [:ea | self testFooAndBar: ea])
		equals: (filter filter: conversations)