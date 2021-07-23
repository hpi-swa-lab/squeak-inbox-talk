tests - patching
testPatchWithAllValues

	| object result |
	self withNewCaseDo: [:case |
		object := Object new.
		result := case patch: object withAllValues: (Dictionary new
			at: #talkPatchedMessage1 put: 42;
			at: #talkPatchedMessage2 put: 43;
			at: #talkPatchedMessage3 put: 44;
			yourself).
		case assert: object equals: result.
		case
			assert: 42 equals: object talkPatchedMessage1;
			assert: 43 equals: object talkPatchedMessage2;
			assert: 44 equals: object talkPatchedMessage3]