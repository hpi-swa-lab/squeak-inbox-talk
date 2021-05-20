tests
testGetStateOf

	self
		patch: project trunkRepository
			at: #versionNamed:
			to: [:this :name | name = 'foo.mcz' ifTrue: [name]];
		patch: project inboxRepository
			at: #versionNamed:
			to: [:this :name | name = 'bar.mcz' ifTrue: [name]].
	
	self assert: #merged equals: (project getStateOf: 'foo').
	self assert: #pending equals: (project getStateOf: 'bar')