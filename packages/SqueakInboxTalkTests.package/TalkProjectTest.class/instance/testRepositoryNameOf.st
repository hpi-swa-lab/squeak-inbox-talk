tests
testRepositoryNameOf

	self
		patch: project trunkRepository at: #allVersionNames withValue: #('foo' 'baz');
		patch: project inboxRepository at: #allVersionNames withValue: #('bar').
	
	self assert: #trunk equals: (project repositoryNameOf: 'foo').
	self assert: #inbox equals: (project repositoryNameOf: 'bar')