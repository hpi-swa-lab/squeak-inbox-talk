initialize-release
initialize

	super initialize.
	
	self
		messageTextSelector: self defaultMessageTextSelector;
		matchStrategy: self defaultMatchStrategy;
		matchesWholeWord: false;
		matchesCase: false;
		hasComplexTerm: true;
		numberOfSurroundingLines: self defaultNumberOfSurroundingLines