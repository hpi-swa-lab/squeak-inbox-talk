initialize-release
initialize

	super initialize.
	
	self
		matchStrategy: self defaultMatchStrategy;
		matchesWholeWord: false;
		matchesCase: false;
		hasComplexTerm: true;
		numberOfSurroundingLines: self defaultNumberOfSurroundingLines