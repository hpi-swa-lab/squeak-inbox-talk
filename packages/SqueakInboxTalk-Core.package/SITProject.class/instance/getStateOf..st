versions
getStateOf: versionName

	(self trunkRepository versionNamed: versionName, '.mcz') ifNotNil: [^ #merged].
	self inboxRepository ifNotNil: [:inbox | (inbox versionNamed: versionName, '.mcz') ifNotNil: [^ #pending]].
	self treatedRepository ifNotNil: [:treated | (treated versionNamed: versionName, '.mcz') ifNotNil: [^ #treated]].
	^ self halt