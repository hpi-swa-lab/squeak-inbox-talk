running
setUp

	super setUp.
	
	contributionFoo1 := self patchNewAt: #package withValue: 'Foo'.
	contributionBar := self patchNewAt: #package withValue: 'Bar'.
	contributionFoo2 := self patchNewAt: #package withValue: 'Foo'.
	
	filter := self classUnderTest new.
	filter inbox: (self patchNewAt: #contributions
		withValue: {contributionFoo1. contributionBar. contributionFoo2})