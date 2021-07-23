accessing - state
selectMatch: aTextSearcherMatch

	self selectMessage: aTextSearcherMatch object.
	
	aTextSearcherMatch label
		ifNil: [self selectTextInterval: aTextSearcherMatch interval]
		ifNotNil: [self selectHeaderTextForKey: aTextSearcherMatch label interval: aTextSearcherMatch interval].
	selectedMatch := aTextSearcherMatch