tests
testPatch

	| object |
	object := Object new.
	
	self
		patch: object
		at: #sitPatchedMessage
		to: [:o | 42]
		during: [self assert: 42 equals: object sitPatchedMessage].
	
	self should: [object sitPatchedMessage] raise: MessageNotUnderstood