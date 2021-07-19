tests - patching
testIsClassPatched

	self deny: (self isClassPatched: Object at: #talkPatchedMessage).
	
	self patchClass: Object at: #talkPatchedMessage with: [:this | this identityHash] during: [ self assert: (self isClassPatched: Object at: #talkPatchedMessage)].
	
	self deny: (self isClassPatched: Object at: #talkPatchedMessage)