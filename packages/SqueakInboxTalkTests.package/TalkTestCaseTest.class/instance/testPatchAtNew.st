tests - patching
testPatchAtNew

	| object |
	object := Object new.
	
	self
		patch: object
		at: #talkPatchedMessage
		with: [:o | 42]
		during: [self assert: 42 equals: object talkPatchedMessage].
	
	self should: [object talkPatchedMessage] raise: MessageNotUnderstood