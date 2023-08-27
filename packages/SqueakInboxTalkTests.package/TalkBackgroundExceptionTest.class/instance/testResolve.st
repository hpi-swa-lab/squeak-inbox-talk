tests
testResolve

	semaphore := Semaphore new.
	
	self runTask.
	
	self assert: #loading equals: result.
	
	semaphore wait.
	0.1 seconds wait.
	self assert: process isSuspended.
	self assert: #loading equals: result.
	self assert: backgroundException isTalkBackgroundException.
	
	0.1 seconds wait.
	self assert: process isSuspended.
	self assert: #loading equals: result.
	self assert: backgroundException isTalkBackgroundException.
	
	backgroundException resolve:
		[backgroundException exception resume: 42].
	
	0.1 seconds wait.
	semaphore wait.
	self assert: #loading equals: result.
	self assert: backgroundException isNil.
	
	semaphore wait.
	0.1 seconds wait.
	self assert: process isTerminated.
	self assert: 42 equals: result.
	self assert: backgroundException isNil.