initialize-release
initialize

	super initialize.
	
	searchModel := self newSearchModel.
	searchModel addDependent: self