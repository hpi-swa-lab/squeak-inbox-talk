initialize-release
newSearchModel

	^ TalkTextSearchModel new
		helpText: 'Search messages...';
		addDependent: self;
		yourself