*SqueakInboxTalk-Core-repository-api
sitVersionInfoFromVersionNamed: aString

	self flag: #moveUpstream.
	
	repositories do: [:each | (each versionInfoFromVersionNamed: aString) ifNotNil: [:ver | ^ ver]].
	^ nil