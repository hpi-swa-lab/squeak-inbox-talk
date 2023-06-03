self-updating
selfUpdate
	"TalkInboxBrowser selfUpdate"

	((Project uiManager confirm: 'It is recommended to install the latest Squeak updates first.' title: ('Updating {1}' format: {self appName}) trueChoice: 'Yes, install latest Squeak updates now' falseChoice: 'Skip latest Squeak updates (not recommended)')
		ifNil: [^ self])
		ifTrue: [MCMcmUpdater default doUpdate: true].
	
	^ self selfUpdateFromMetacello