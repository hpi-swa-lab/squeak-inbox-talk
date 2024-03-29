testing
includesMentionOf: aPerson

	(aPerson names anySatisfy: [:name |
		TalkTextSearcher new
			matchesWholeWord: true;
			newTerm: name;
			matchesText: self text]) ifTrue: [^ true].
	
	self flag: #todo.
	"Remove false positive for ancestor versions in mc announcements?"
	^ aPerson allAuthorInitials anySatisfy: [:initials | self text asString includesSubstring: ('-{1}.' format: {initials}) caseSensitive: true]