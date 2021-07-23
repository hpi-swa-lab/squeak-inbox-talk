accessing - contents
startComputingContents

	self containingWindow ifNil: [^ self].
	
	self
		backgroundWorkerFor: #contents
		do: [contents := self fullContents]
		thenDo: [self changed: #contents]