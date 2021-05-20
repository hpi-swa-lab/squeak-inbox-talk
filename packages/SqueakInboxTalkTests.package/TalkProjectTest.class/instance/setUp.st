running
setUp

	super setUp.
	
	project := self classUnderTest new
		trunkRepository: (self patch: Object new at: #isValid withValue: true);
		inboxRepository: (self patch: Object new at: #isValid withValue: true);
		yourself.
	"Avoid side effects to global repository group"
	self
		patch: MCRepositoryGroup
		at: #default
		withValue: (self patch: MCRepositoryGroup default at: #addRepository: with: [])