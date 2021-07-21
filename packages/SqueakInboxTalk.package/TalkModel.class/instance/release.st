initialize-release
release

	self backgroundWorkers do: [:worker |
		worker
			environmentAt: #talkReleasing put: true;
			terminate].
	
	^ super release