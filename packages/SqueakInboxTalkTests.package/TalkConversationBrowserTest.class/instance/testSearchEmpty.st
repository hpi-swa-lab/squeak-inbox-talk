tests - searching
testSearchEmpty

	browser searchModel accept: ''.
	self deny: browser searchModel hasSearchError.
	self assert: self selectedBrowserText isEmpty.