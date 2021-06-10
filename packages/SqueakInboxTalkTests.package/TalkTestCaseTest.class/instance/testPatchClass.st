tests - patching
testPatchClass

	| old |
	old := Object new.
	
	self patchClass: Object at: #sitPatchedMessage with: [:this | this identityHash] during: [ | new |
		self assert: old identityHash equals: old sitPatchedMessage.
		new := Array new.
		self assert: new identityHash equals: new sitPatchedMessage].
	
	self should: [old sitPatchedMessage] raise: MessageNotUnderstood