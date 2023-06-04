initialize-release
searcher: aTextSearcher

	aTextSearcher messageTextSelector: self messageFormatSelector.
	searchModel setSearcher: aTextSearcher.