background workers
backgroundWorkerFor: aSymbol do: workBlock updating: updateBlock thenDo: uiBlock
	"Start a background process for aBlock that is associated to aSymbol. After the worker succeeded, run uiBlock in the UI process. If another background worker is running at the beginning, terminate it."

	| lastUpdate updateInterval isUpdating startTime worker |
	Smalltalk isMorphic ifFalse: [
		workBlock cull: updateBlock.
		uiBlock value.
		^ self].
	
	self terminateBackgroundWorkerFor: aSymbol.
	
	updateInterval := (self stepTimeForBackgroundWorkers / 2) asMilliSeconds.
	"prepare step messages with a higher frequency"
	lastUpdate := 0.
	isUpdating := false.
	startTime := Time millisecondClockValue.
	
	worker := nil.
	worker := backgroundWorkers at: aSymbol put: ([ | result |
		[
			result := workBlock cull: (updateBlock ifNotNil: [
				[
					(isUpdating not and: [(Time millisecondsSince: lastUpdate) >= updateInterval]) ifTrue: [
						isUpdating := true.
						backgroundWorkerUpdateMessages nextPut: [
							updateBlock value.
							isUpdating := false].
						lastUpdate := Time millisecondClockValue]]])] ensure: [self stopSteppingForBackgroundWorker: worker].
		Project current addDeferredUIMessage: [
			updateBlock value.
			uiBlock cull: result]] newProcess priority: (self backgroundWorkerPriorityFor: aSymbol)).
	updateBlock ifNotNil: [self assureSteppingForBackgroundWorker: worker].
	worker resume