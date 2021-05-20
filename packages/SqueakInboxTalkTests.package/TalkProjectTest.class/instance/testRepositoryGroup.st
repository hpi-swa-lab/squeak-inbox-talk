tests
testRepositoryGroup

	self assert: (project repositoryGroup includes: project trunkRepository).
	self assert: (project repositoryGroup includes: project inboxRepository).
	self deny: (project repositoryGroup includes: MCRepository trunk)