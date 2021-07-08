initialize-release
release

	backgroundWorkers do: [:worker | worker ifNotNil: [worker terminate]].
	
	^ super release