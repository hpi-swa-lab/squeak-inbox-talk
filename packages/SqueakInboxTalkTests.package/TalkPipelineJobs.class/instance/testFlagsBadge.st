tests
testFlagsBadge

	| flags flagsCount |
	"
	self systemNavigation browseAllCallsOn: #flag: localToPackage: 'SqueakInboxTalk'
	"
	flags := self systemNavigation
		allCallsOn: #flag:
		localToPackage: 'SqueakInboxTalk'.
	flagsCount := flags size.
	Transcript
		showln: ('open flags ({1}): ' format: {flagsCount});
		show: flags asCommaString.
	
	self
		updateBadgeNamed: ('flags/{1}' format: {self githubRefName})
		label: 'open flags'
		value: flagsCount asString
		color: #informational:.
	
	Transcript showln: 'Updated GitHub badge.'