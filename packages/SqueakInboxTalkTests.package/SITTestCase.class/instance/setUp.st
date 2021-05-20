running
setUp

	super setUp.
	
	wrappers := OrderedCollection new.
	
	methodWrappers := OrderedCollection new.
	self wrapTest: [:block | block ensure: [methodWrappers reverseDo: [:wrapper | wrapper uninstall]]]