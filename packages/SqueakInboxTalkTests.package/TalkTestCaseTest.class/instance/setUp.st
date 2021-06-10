running
setUp

	super setUp.
	
	(self selector beginsWith: 'testPatch') ifTrue: [self wrapTest: [:block | self shouldNotChange: [TalkTestMethodWrapper findExistingWrappers] during: block "does it smoke?"]]
