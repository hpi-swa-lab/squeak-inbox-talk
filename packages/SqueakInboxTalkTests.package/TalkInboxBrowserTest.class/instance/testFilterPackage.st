tests - filtering
testFilterPackage

	[self toggleFilter: 'contributions to packages*' to: true] valueSupplyingAnswer: {'*packages*'. browser inbox allPackageNames select: [:package | package first asLowercase > $j]}.
	self waitWhileBusy.
	
	self shouldBeFiltered: [:conversation | conversation contributions notEmpty and: [conversation contributions first package first asLowercase > $j]]