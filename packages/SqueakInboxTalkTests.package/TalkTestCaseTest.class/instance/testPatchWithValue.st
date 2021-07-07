tests - patching
testPatchWithValue

	| object |
	object := Object new.
	
	self
		patch: object
		at: #talkPatchedMessage
		withValue: 42
		during: [self assert: 42 equals: object talkPatchedMessage].
	
	self should: [object talkPatchedMessage] raise: MessageNotUnderstood