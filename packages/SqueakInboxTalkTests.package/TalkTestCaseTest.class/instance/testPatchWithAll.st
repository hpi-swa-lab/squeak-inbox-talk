tests - patching
testPatchWithAll

	| object result |
	self withNewCaseDo: [:case |
		object := Object new.
		result := case patch: object withAll: (Dictionary new
			at: #talkPatchedMessage1 put: [:o | 42];
			at: #talkPatchedMessage2 put: [:o | 43];
			at: #talkPatchedMessage3 put: [:o | 44];
			yourself).
		case assert: object equals: result.
		case
			assert: 42 equals: object talkPatchedMessage1;
			assert: 43 equals: object talkPatchedMessage2;
			assert: 44 equals: object talkPatchedMessage3]