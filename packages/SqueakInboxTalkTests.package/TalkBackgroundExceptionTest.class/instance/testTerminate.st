tests
testTerminate

	semaphore := Semaphore new.
	
	self runTask.
	
	self assert: #loading equals: result.
	
	semaphore wait.
	0.1 seconds wait.
	self assert: process isSuspended.
	self assert: #loading equals: result.
	self assert: backgroundException isTalkBackgroundException.
	
	backgroundException process terminate.
	
	0.1 seconds wait.
	semaphore wait.
	self assert: process isTerminated.
	self assert: result isNil.
	self assert: backgroundException isNil.