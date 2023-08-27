self-updating
selfUpdateMetacelloSpec: aString

	self basicSelfUpdateMetacelloSpec: aString.
	
	(Project uiManager confirm: 'Would you like to install updates now?' title: ('{1} self-update' format: {self appName}))
		ifTrue: [self selfUpdate]