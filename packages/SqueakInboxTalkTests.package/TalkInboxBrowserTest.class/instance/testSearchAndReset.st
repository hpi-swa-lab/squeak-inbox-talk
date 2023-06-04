tests - filtering
testSearchAndReset

	browser searchModel searchTerm: UUID new asString.
	self waitWhileBusy.
	self assert: browser conversations isEmpty.
	
	browser resetAllFilters.
	self waitWhileBusy.
	self shouldNotBeFiltered.