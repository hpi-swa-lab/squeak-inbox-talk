versions
repositoryNameOf: versionName

	(self includesVersionNamed: versionName in: self trunkRepository) ifTrue: [^ #trunk].
	self inboxRepository ifNotNil: [:inbox | (self includesVersionNamed: versionName in: inbox) ifTrue: [^ #inbox]].
	self treatedRepository ifNotNil: [:treated | (self includesVersionNamed: versionName in: treated) ifTrue: [^ #treated]].
	^ nil