self-updating
installDependencies
	"Install most important dependencies. Metacello>>#get is not recursive."

	Metacello new
		baseline: 'SqueakHistory';
		repository: 'github://LinqLover/squeak-history:stream-github--hpi-swa-lab--squeak-inbox-talk/packages';
		get;
		load: 'SqueakHistory'.
	
	(Smalltalk hasClassNamed: #TalkSemanticConversationBrowserPlugin) ifTrue: [
		self flag: #todo. "rename repo"
		Metacello new
			baseline: 'SemanticText';
			repository: 'github://LinqLover/squeak-chatgpt:main';
			get;
			load].