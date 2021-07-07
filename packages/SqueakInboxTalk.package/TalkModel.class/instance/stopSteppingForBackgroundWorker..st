background workers
stopSteppingForBackgroundWorker: backgroundWorker

	backgroundWorker environmentAt: #talkBackgroundWorkerWantsSteps put: false.
	
	(self backgroundWorkers anySatisfy: [:worker | worker environmentAt: #talkBackgroundWorkerWantsSteps ifAbsent: [false]]) ifTrue: [^ self].
	
	(self currentWorld isStepping: self selector: #stepForBackgroundWorkerAt:) ifFalse: [^ self].
	self currentWorld stopStepping: self selector: #stepForBackgroundWorkerAt: