tests
testRefreshVersions

	project inboxRepository: nil.
	self patch: project trunkRepository at: #allVersionNames withValue: #('foo').
	
	self assert: #trunk equals: (project repositoryNameOf: 'foo').
	self deny: #trunk equals: (project repositoryNameOf: 'baz').
	
	self patch: project trunkRepository at: #allVersionNames withValue: #('foo' 'baz').
	project refreshVersions.
	
	self assert: #trunk equals: (project repositoryNameOf: 'foo').
	self assert: #trunk equals: (project repositoryNameOf: 'baz')