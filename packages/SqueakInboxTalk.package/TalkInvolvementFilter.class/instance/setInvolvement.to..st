accessing
setInvolvement: aSymbol to: aBoolean

	aBoolean ifTrue: [self assurePerson].
	aBoolean ifFalse: [involvements remove: aSymbol] ifTrue: [involvements add: aSymbol].
	
	self changed