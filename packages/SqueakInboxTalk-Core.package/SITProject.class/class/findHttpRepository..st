as yet unclassified
findHttpRepository: location

	^ MCRepositoryGroup default repositories
		detect: [:each | (each isKindOf: MCHttpRepository) and: [each description = location]]
		ifNone: [MCHttpRepository location: location]