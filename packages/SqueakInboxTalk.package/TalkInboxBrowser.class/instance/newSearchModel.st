initialize-release
newSearchModel

	^ TalkTextSearchModel new
		helpText: 'Search conversations...';
		addDependent: self;
		yourself