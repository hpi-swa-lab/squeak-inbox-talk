tests - patching
testPatchStably

	| object |
	self withNewCaseDo: [:case |
		object := Object new.
		case patch: object at: #talkPatchedMessage with: [:o | 42].
		case assert: 42 equals: object talkPatchedMessage]