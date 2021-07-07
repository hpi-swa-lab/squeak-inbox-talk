tests - running
testWrapTest

	| data |
	data := 0.
	self withNewCaseDo: [:case |
		case wrapTest: [:block |
			data := data + 1.
			block ensure: [data := data + 1]].
		self assert: 1 equals: data].
	self assert: 2 equals: data.
	
	self assert: 2 equals: data