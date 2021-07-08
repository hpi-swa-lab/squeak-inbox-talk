private
versionNamed: aString in: mcRepositoryLike

	^ [mcRepositoryLike versionNamed: aString, '.mcz']
		on: MCEmptyVersion
		do: #resume