self-updating
installDependencies
	"Install most important dependencies. Metacello>>#get is not recursive."

	Metacello new
		baseline: 'SqueakHistory';
		repository: 'github://hpi-swa/squeak-history:master/packages';
		get;
		load: 'SqueakHistory'.
	
	(Smalltalk hasClassNamed: #TalkSemanticConversationBrowserPlugin) ifTrue: [
		Metacello new
			baseline: 'SemanticText';
			repository: 'github://hpi-swa-lab/Squeak-SemanticText:main';
			get;
			load].