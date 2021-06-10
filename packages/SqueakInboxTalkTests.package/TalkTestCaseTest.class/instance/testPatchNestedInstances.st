tests - patching
testPatchNestedInstances

	| first second |
	first := Object new.
	second := Object new.
	
	self patch: first at: #sitPatchedMessage with: [:o | 42] during: [
		self patch: second at: #sitPatchedMessage with: [:o | 1337] during: [
			self assert: 42 equals: first sitPatchedMessage.
			self assert: 1337 equals: second sitPatchedMessage]].
	
	self should: [first sitPatchedMessage] raise: MessageNotUnderstood.
	self should: [second sitPatchedMessage] raise: MessageNotUnderstood