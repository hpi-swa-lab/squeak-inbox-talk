initialize-release
release

	self backgroundWorkers do: #terminate.
	
	^ super release