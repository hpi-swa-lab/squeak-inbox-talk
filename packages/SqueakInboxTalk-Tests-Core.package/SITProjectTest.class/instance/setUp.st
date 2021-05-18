running
setUp

	super setUp.
	
	project := SITProject new
		trunkRepository: (self patch: Object new at: #isValid toValue: true);
		inboxRepository: (self patch: Object new at: #isValid toValue: true);
		yourself.
	"Avoid side effects to global repository group"
	self
		patch: MCRepositoryGroup
		at: #default
		toValue: (self patch: MCRepositoryGroup default at: #addRepository: to: [])