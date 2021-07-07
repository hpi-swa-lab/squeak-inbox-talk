tests
testSearch

	browser searchModel searchTerm: 'hi'.
	self waitWhileBusy.
	
	self flag: #brittle.
	self shouldBeFiltered