initialize-release
initialize

	super initialize.
	
	backgroundWorkers := WeakValueDictionary new.
	backgroundWorkerUpdateMessages := SharedQueue new