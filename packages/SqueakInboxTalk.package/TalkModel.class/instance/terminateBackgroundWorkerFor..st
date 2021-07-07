background workers
terminateBackgroundWorkerFor: aSymbol

	(backgroundWorkers removeKey: aSymbol ifAbsent: []) ifNotNil: [:oldWorker | oldWorker terminate]