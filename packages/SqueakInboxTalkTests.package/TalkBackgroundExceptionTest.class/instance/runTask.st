support
runTask

	result := #loading.
	
	process := [[[| tmp |
	0.3 seconds wait.
	tmp := Notification signal: #test.
	0.3 seconds wait.
	semaphore signal.
	result := tmp.
	semaphore signal]
		on: Notification do: [:ex |
			backgroundException := self classUnderTest for: ex.
			semaphore signal.
			[backgroundException waitForResolution] ensure:
				[backgroundException := nil]]]
		ifCurtailed:
			[result := nil.
			semaphore signal]]
		
		forkAt: Processor activePriority - 1.
	
	self wrapTest: [:block | block ensure: [process terminate]].