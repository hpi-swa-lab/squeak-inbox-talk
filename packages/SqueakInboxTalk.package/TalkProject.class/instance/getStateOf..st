versions
getStateOf: versionName

	(self includesVersionNamed: versionName in: self trunkRepository) ifTrue: [^ #merged].
	self inboxRepository ifNotNil: [:inbox | (self includesVersionNamed: versionName in: inbox) ifTrue: [^ #pending]].
	self treatedRepository ifNotNil: [:treated | (self includesVersionNamed: versionName in: treated) ifTrue: [^ #treated]].
	^ #treated