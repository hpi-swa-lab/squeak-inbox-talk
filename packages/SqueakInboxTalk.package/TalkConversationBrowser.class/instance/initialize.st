initialize-release
initialize

	super initialize.
	
	searchModel := TalkTextSearchModel new.
	searchModel addDependent: self