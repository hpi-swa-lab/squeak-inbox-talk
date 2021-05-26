*SqueakInboxTalk-Core-repository-api
talkVersionInfoFromVersionNamed: aString

	self flag: #moveUpstream.
	
	repositories do: [:each | (each versionInfoFromVersionNamed: aString) ifNotNil: [:ver | ^ ver]].
	^ nil