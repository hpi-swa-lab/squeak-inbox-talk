testing
includesLabel: aString

	^ self allRepositoryNames anySatisfy: [:name |
		(self repositoryLabelsForName: name) includes: aString]