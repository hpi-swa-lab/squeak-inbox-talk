background workers
backgroundWorkerPriorityFor: aSymbol

	^ (super backgroundWorkerPriorityFor: aSymbol) + (aSymbol = #contents ifTrue: [1] ifFalse: [0])