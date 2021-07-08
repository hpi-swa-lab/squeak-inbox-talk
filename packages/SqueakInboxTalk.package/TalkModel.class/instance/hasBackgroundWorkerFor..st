background workers
hasBackgroundWorkerFor: aSymbol

	^ self
		backgroundWorkerFor: aSymbol
		ifPresent: [:process | process isTerminated not]
		ifAbsent: [false]