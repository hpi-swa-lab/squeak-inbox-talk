tests
testSearch

	browser searchModel searchTerm: 'hi'.
	self waitWhileBusy.
	
	self deny: browser searchModel hasSearchError.
	self shouldBeFiltered