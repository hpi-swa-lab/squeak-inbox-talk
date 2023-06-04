tests - filtering
testSearchAndFilter

	browser searchModel searchTerm: 'hi'.
	self toggleFilter: 'contributions with state merged' to: false.
	self waitWhileBusy.
	
	self flag: #brittle.
	self shouldBeFiltered: [:conversation | conversation contributionState ~= #merged]