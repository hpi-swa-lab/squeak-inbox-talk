*SqueakInboxTalkTests-Core-versions-Monticello-ct.750-override
versionNamed: aMCVersionName

	^ self versionWithInfo: (dict keys detect: [:info | info name = aMCVersionName] ifNone: [^ nil])