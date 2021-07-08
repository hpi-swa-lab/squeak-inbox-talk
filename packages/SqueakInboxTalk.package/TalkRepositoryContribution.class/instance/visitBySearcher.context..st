searching
visitBySearcher: aTextSearcher context: context

	aTextSearcher
		visit: self
		searchableLabel: ('{1} ({2})' format: {self versionName. self state})
		contents: self messageText
		context: context.
	aTextSearcher visit: self contents: self diffText context: context