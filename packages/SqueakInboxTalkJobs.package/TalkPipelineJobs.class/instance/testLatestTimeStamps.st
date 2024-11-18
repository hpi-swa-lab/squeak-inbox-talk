jobs
testLatestTimeStamps

	| timeStamps |
	self flag: #todo. "all pipeline jobs must run in separate ci job with all packages loaded!"
	
	timeStamps := TalkInboxBrowser latestPackageTimeStamps associations
		collect: [:packageInfoAndTimeStamp |
			packageInfoAndTimeStamp key name -> packageInfoAndTimeStamp value asDateAndTime asUTC asString]
		as: Dictionary.
	Transcript
		showln: 'latest time stamps: ';
		show: timeStamps printString.
	
	self
		updateLatestTimeStampsFor: ('latestTimeStamps/{1}' format: {self githubRefName})
		data: timeStamps.
	
	Transcript showln: 'Updated latest time stamps.'.