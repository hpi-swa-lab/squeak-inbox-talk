running
setUp

	super setUp.
	
	contributionFoo1 := self patchNewAt: #project withValue: 'Foo'.
	contributionBar := self patchNewAt: #project withValue: 'Bar'.
	contributionFoo2 := self patchNewAt: #project withValue: 'Foo'.
	
	filter := self classUnderTest new.
	filter inbox: (self patchNewAt: #projects withValue: {contributionFoo1. contributionBar. contributionFoo2})