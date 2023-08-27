preferences
enableSemanticSearch: aBoolean

	aBoolean ifTrue: [
		TalkInboxBrowser ensureSemanticsPackageOrCancel ifNil: [^ self]].
	
	EnableSemanticSearch := aBoolean.