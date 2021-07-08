background workers
assureSteppingForBackgroundWorker: backgroundWorker

	backgroundWorker environmentAt: #talkBackgroundWorkerWantsSteps put: true.
	
	(self currentWorld isStepping: self selector: #stepForBackgroundWorkerAt:) ifTrue: [^ self].
	self currentWorld
		startStepping: self
		at: Time millisecondClockValue
		selector: #stepForBackgroundWorkerAt:
		arguments: nil
		stepTime: self stepTimeForBackgroundWorkers asMilliSeconds