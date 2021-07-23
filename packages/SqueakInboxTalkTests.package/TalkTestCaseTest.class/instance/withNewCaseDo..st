support
withNewCaseDo: aBlock

	| case |
	case := self classUnderTest selector: self selector.
	
	case setUp.
	(self respondsTo: #isResumable) ifTrue: [case resumable: self isResumable].
	^ [aBlock value: case] ensure: [case tearDown]