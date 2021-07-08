tests
testFilterContributions

	self toggleFilter: 'conversations without contributions' to: false.
	self waitWhileBusy.
	
	"note: in the last 2 years, there was never a week w/o any contributions."
	self shouldBeFiltered: [:conversation | conversation contributions notEmpty]