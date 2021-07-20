searching
visitBySearcher: aTextSearcher context: context

	aTextSearcher
		visit: self
		searchableLabel: self versionNameWithState
		contents: self messageText
		context: context.
	aTextSearcher visit: self contents: self diffText context: context