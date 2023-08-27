resolving
resolve: aSymbolOrBlock

	resolution := aSymbolOrBlock.
	process
		ifNil: [self resolve]
		ifNotNil: [process resume].