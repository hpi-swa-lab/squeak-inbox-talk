tests - patching
testPatchAll

	| objects |
	objects := {Object new. {Object new}. Object new -> Object new}.
	
	self
		patchAll: objects
		at: #talkPatchedMessage
		withValue: 42
		during: [objects do: [:object | self assert: 42 equals: object talkPatchedMessage]].
	
	objects do: [:object | self should: [object talkPatchedMessage] raise: MessageNotUnderstood]