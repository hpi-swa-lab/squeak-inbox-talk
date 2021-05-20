tests
testGetStateOf

	self
		patch: project trunkRepository
			at: #versionNamed:
			with: [:this :name | name = 'foo.mcz' ifTrue: [name]];
		patch: project inboxRepository
			at: #versionNamed:
			with: [:this :name | name = 'bar.mcz' ifTrue: [name]].
	
	self assert: #merged equals: (project getStateOf: 'foo').
	self assert: #pending equals: (project getStateOf: 'bar')