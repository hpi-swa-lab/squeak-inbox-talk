background workers
assureSteppingForBackgroundWorker: backgroundWorker

	backgroundWorker environmentAt: #talkBackgroundWorkerWantsSteps put: true.
	
	Project current addDeferredUIMessage: [
		(self currentWorld isStepping: self selector: #stepForBackgroundWorkerAt:) ifFalse: [
			self currentWorld
				startStepping: self
				at: Time millisecondClockValue
				selector: #stepForBackgroundWorkerAt:
				arguments: nil
				stepTime: self stepTimeForBackgroundWorkers asMilliSeconds]]