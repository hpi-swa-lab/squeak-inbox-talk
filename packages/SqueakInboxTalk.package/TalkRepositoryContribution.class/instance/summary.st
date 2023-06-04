accessing - contribution
summary

	self conversations ifNotEmpty: [ | text search index |
		text := self latestConversation initialMessage text.
		search := '==================== Summary ===================='.
		index := (text take: 1000) asString findString: search.
		index > 0 ifTrue: [
			^ (text allButFirst: index + search size) withoutLeadingBlanks]].
	
	^ self versionInfo summary