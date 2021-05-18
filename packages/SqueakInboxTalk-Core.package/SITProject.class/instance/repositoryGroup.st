accessing
repositoryGroup

	^ repositoryGroup ifNil: [ | group |
		group := MCRepositoryGroup new.
		group addRepository: self trunkRepository.
		self inboxRepository ifNotNil: [:inbox | group addRepository: inbox].
		self treatedRepository ifNotNil: [:treated | group addRepository: treated].
		repositoryGroup := group]