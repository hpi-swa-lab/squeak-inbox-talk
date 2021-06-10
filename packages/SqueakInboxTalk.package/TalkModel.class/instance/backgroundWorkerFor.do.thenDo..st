private
backgroundWorkerFor: aSymbol do: aBlock thenDo: uiBlock
	"Start a background process for aBlock that is associated to aSymbol. After the worker succeeded, run uiBlock in the UI process. If another background worker is running at the beginning, terminate it."

	(backgroundWorkers removeKey: aSymbol ifAbsent: []) ifNotNil: [:oldWorker | oldWorker terminate].
	
	backgroundWorkers at: aSymbol put: ([ | result |
		result := aBlock value.
		Project current addDeferredUIMessage: [uiBlock cull: result]] forkAt: Processor userBackgroundPriority)