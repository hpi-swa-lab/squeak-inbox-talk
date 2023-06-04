initialize-release
setSearcher: aTextSearcher

	searcher ifNotNil: [searcher removeDependent: self].
	searcher := aTextSearcher.
	searcher ifNotNil: [searcher addDependent: self].