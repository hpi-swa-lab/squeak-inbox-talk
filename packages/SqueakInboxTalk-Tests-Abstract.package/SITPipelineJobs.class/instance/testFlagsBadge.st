tests
testFlagsBadge

	| flags flagsCount |
	flags := self systemNavigation
		allCallsOn: #flag:
		localToPackage: 'SqueakInboxTalk'.
	flagsCount := flags size.
	
	self
		updateBadgeNamed: ('flags/{1}' format: {self githubRefName})
		label: 'open flags'
		value: flagsCount asString
		color: #informational