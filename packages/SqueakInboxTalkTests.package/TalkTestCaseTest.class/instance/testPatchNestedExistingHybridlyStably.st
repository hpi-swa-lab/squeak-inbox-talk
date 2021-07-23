tests - patching
testPatchNestedExistingHybridlyStably

	| object |
	object := Object new.
	self assert: object -> 42 equals: (object talkTestBinaryMessage: 42).
	
	self withNewCaseDo: [:case |
		case patch: object at: #talkTestBinaryMessage: with: [:this :anObject | {this. anObject}] during: [
			self assert: {object. 42} equals: (object talkTestBinaryMessage: 42).
			self
				should: [case patch: object at: #talkTestBinaryMessage: with: [:this :anObject | {anObject. this}]]
				raise: Error.
			self assert: {object. 42} equals: (object talkTestBinaryMessage: 42)]].
	
	self assert: object -> 42 equals: (object talkTestBinaryMessage: 42)