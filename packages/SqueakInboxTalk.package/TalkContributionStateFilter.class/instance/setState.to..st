accessing
setState: aSymbol to: aBoolean

	states
		remove: aSymbol ifAbsent: [states add: aSymbol];
		ifEmpty: [self reset].
	
	self changed