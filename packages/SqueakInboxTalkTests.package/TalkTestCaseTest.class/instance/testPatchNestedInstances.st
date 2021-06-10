tests - patching
testPatchNestedInstances

	| first second |
	first := Object new.
	second := Object new.
	
	self patch: first at: #talkPatchedMessage with: [:o | 42] during: [
		self patch: second at: #talkPatchedMessage with: [:o | 1337] during: [
			self assert: 42 equals: first talkPatchedMessage.
			self assert: 1337 equals: second talkPatchedMessage]].
	
	self should: [first talkPatchedMessage] raise: MessageNotUnderstood.
	self should: [second talkPatchedMessage] raise: MessageNotUnderstood