*SqueakInboxTalk-UI-accessing
versionNameWithState

	| state |
	state := self state ifNil: [^ self versionName].
	^ '{1} ({2})' format: {self versionName. state}