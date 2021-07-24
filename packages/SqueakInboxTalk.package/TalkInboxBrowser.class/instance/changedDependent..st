updating
changedDependent: aspect

	super changedDependent: aspect.
	
	aspect = #contents ifTrue: [self simpleContents ifNil: [self startComputingContents]]