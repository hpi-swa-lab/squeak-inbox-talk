tests
testWrapTest

	| data case |
	data := 0.
	case := self classUnderTest new.
	
	case setUp.
	[
		case wrapTest: [:block |
			data := data + 1.
			block ensure: [data := data + 1]].
		self assert: 1 equals: data] ensure: [case tearDown].
	self assert: 2 equals: data.
	
	self assert: 2 equals: data