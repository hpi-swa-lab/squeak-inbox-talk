self-updating
installDependencies
	"Install most important dependencies. Metacello>>#get is not recursive."

	Metacello new
		baseline: 'SqueakHistory';
		repository: 'github://LinqLover/squeak-history:stream-github--hpi-swa-lab--squeak-inbox-talk/packages';
		get;
		load: 'SqueakHistory'.