tests
testFilterContributionStates

	self toggleFilter: 'contributions with state merged' to: false.
	self waitWhileBusy.
	
	self shouldBeFiltered: [:conversation | conversation contributionState ~= #merged]