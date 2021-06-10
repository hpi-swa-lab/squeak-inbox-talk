support
withNewCaseDo: aBlock

	| case |
	case := self classUnderTest new.
	
	case setUp.
	^ [aBlock value: case] ensure: [case tearDown]