running
setUp

	super setUp.
	
	self
		patch: TalkPerson at: #current withValue: TalkPerson basicNew;
		patch: TalkPerson at: #currentOrNil with: [TalkPerson current]