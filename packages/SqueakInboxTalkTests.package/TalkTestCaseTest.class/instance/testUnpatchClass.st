tests - patching
testUnpatchClass

	| object |
	object := Object new.
	
	self patchClass: Object at: #talkPatchedMessage with: [:this | this identityHash] during: [
		self assert: object identityHash equals: object talkPatchedMessage.
		
		self
			unpatchClass: Object
			at: #talkPatchedMessage
			during: [self should: [object talkPatchedMessage] raise: MessageNotUnderstood].
		
		self assert: object identityHash equals: object talkPatchedMessage].
	
	self should: [object talkPatchedMessage] raise: MessageNotUnderstood