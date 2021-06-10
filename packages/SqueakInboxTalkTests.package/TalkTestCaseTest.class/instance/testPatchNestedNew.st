tests - patching
testPatchNestedNew

	| object |
	object := Object new.
	
	self patch: object at: #sitPatchedMessage with: [:o | 42] during: [
		self assert: 42 equals: object sitPatchedMessage.
		self
			patch: object
			at: #sitPatchedMessage
			with: [:o | 41]
			during: [self assert: 41 equals: object sitPatchedMessage].
		self assert: 42 equals: object sitPatchedMessage].
	
	self should: [object sitPatchedMessage] raise: MessageNotUnderstood