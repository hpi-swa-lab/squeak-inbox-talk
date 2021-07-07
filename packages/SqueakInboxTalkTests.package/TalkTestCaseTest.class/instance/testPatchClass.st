tests - patching
testPatchClass

	| old |
	old := Object new.
	
	self patchClass: Object at: #talkPatchedMessage with: [:this | this identityHash] during: [ | new |
		self assert: old identityHash equals: old talkPatchedMessage.
		new := Array new.
		self assert: new identityHash equals: new talkPatchedMessage].
	
	self should: [old talkPatchedMessage] raise: MessageNotUnderstood