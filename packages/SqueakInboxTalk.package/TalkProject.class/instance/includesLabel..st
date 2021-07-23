testing
includesLabel: aString

	^ self allRepositoryNames anySatisfy: [:repositoryName | (self repositoryLabelsForName: repositoryName) includes: aString]