updating
changedDependent: aspect

	super changedDependent: aspect.
	
	aspect
		caseOf: {
			[#contents] -> [
				(self simpleContents isNil and: [contents isNil]) ifTrue: [
					self
						backgroundWorkerFor: #contents
						do: [contents := self fullContents]
						thenDo: [self changed: #contents]]]}
		otherwise: []