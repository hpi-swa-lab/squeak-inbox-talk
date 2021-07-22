tests - patching
testPatchNew

	self withNewCaseDo: [:case | | object |
		object := case patchNewAt: #talkPatchedMessage withValue: 42.
		
		case assert: 42 equals: object talkPatchedMessage]