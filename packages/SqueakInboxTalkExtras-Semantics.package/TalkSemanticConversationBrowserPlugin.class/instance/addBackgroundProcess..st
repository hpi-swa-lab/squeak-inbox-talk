private
addBackgroundProcess: aProcess

	(backgroundProcesses ifNil: [backgroundProcesses := WeakSet new])
		add: aProcess.