accessing
inboxRepository: anMCRepository label: label

	self inboxRepository: anMCRepository.
	self repositoryLabelsForName: #inbox put: {label}