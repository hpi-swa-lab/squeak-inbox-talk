tests
testGetStateOf

	self
		patch: project trunkRepository
			at: #allVersionNames
			withValue: #('foo' 'baz');
		patch: project inboxRepository
			at: #allVersionNames
			withValue: #('bar').
	
	self assert: #merged equals: (project getStateOf: 'foo').
	self assert: #pending equals: (project getStateOf: 'bar')