background workers
backgroundWorkerFor: aSymbol do: workBlock updating: updateBlock thenDo: uiBlock
	"Start a background process for aBlock that is associated to aSymbol. aBlock will be passed an updaterBlock that it should evaluate as often as possible in order to have the background worker report status updates back to the receiver via the passed updateBlock (they will be scheduled via Morphic step messages). After the worker succeeded, run uiBlock in the UI process (this will be scheduled via a deferred UI message). If another background worker is running at the beginning, terminate it. Thread-safe implementation."

	| lastUpdate updateInterval isUpdating startTime worker alive |
	self flag: #refactor.
	"Never touch a running system. But if you still need to do so, extracting this into its own class would be a very good first step."
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
	alive := true.
	
	worker := nil.
	worker := backgroundWorkers at: aSymbol put: ([ | result |
		[
			result := workBlock cull: (updateBlock ifNotNil: [
				[
					(isUpdating not and: [(Time millisecondsSince: lastUpdate) >= updateInterval]) ifTrue: [
						isUpdating := true.
						backgroundWorkerUpdateMessages nextPut: worker -> [
							alive ifTrue: [updateBlock value].
							isUpdating := false].
						lastUpdate := Time millisecondClockValue]]]).
			Project current addDeferredUIMessage: [
				(worker environmentAt: #talkEnvironment ifAbsent: []) = true ifFalse: [
					updateBlock value.
					uiBlock cull: result]]] ensure: [
			alive := false.
			backgroundWorkerUpdateMessages flushAllSuchThat: [:message | message key == worker].
			self stopSteppingForBackgroundWorker: worker]] newProcess priority: (self backgroundWorkerPriorityFor: aSymbol)).
	updateBlock ifNotNil: [self assureSteppingForBackgroundWorker: worker].
	worker resume