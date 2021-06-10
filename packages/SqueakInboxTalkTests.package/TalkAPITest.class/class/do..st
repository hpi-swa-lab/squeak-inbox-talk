support
do: aBlock

	| case |
	case := self new.
	case setUp.
	^ [aBlock value: case] ensure: [case tearDown]