actions
doSelfUpdate

	(Project uiManager confirm: ('You are using a beta version of {1} which is still\under development! While updating can bring new you new\exciting features and bugfixes, it also might introduce regressions\and set your machine on fire!\\Update anyway?' withCRs format: {self appName})) ifFalse: [^ false].
	
	self class selfUpdate.
	^ true