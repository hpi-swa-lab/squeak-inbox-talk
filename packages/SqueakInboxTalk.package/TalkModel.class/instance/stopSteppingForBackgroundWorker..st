background workers
stopSteppingForBackgroundWorker: backgroundWorker

	backgroundWorker environmentAt: #talkBackgroundWorkerWantsSteps put: false.
	
	(self backgroundWorkers anySatisfy: [:worker | worker environmentAt: #talkBackgroundWorkerWantsSteps ifAbsent: [false]]) ifTrue: [^ self].
	
	Project current addDeferredUIMessage: [
		(self currentWorld isStepping: self selector: #stepForBackgroundWorkerAt:) ifTrue: [
			self currentWorld stopStepping: self selector: #stepForBackgroundWorkerAt:]]