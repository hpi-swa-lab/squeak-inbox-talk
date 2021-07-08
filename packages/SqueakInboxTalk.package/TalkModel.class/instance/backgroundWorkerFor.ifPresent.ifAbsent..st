background workers
backgroundWorkerFor: aSymbol ifPresent: presentBlock ifAbsent: absentBlock

	^ presentBlock value: ((backgroundWorkers at: aSymbol ifAbsent: []) ifNil: [^ absentBlock value])