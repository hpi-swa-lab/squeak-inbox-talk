preferences
enableSemanticSearch: aBoolean

	aBoolean ifTrue: [
		TalkInboxBrowser ensureSemanticTextOrCancel ifNil: [^ self]].
	
	EnableSemanticSearch := aBoolean.