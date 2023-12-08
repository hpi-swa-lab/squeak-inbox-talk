accessing
documentsPerMessage

	documentsPerMessage ifNil: [self swapInFromDisk].
	^ documentsPerMessage