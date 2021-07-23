tests - patching
testPatchNestedExisting

	| object |
	object := Object new.
	self assert: object -> 42 equals: (object talkTestBinaryMessage: 42).
	
	self patch: object at: #talkTestBinaryMessage: with: [:this :anObject | {this. anObject}] during: [
		self assert: {object. 42} equals: (object talkTestBinaryMessage: 42).
		self
			patch: object
			at: #talkTestBinaryMessage:
			with: [:this :anObject | {anObject. this}]
			during: [self assert: {42. object} equals: (object talkTestBinaryMessage: 42)].
		self assert: {object. 42} equals: (object talkTestBinaryMessage: 42)].
	
	self assert: object -> 42 equals: (object talkTestBinaryMessage: 42)