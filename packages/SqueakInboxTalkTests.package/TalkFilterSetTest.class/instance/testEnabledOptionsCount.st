tests
testEnabledOptionsCount

	self
		patch: foo at: #enabledOptionsCount withValue: 100;
		patch: bar at: #enabledOptionsCount withValue: 10.
	
	self assert: 100 + 10 equals: filter enabledOptionsCount