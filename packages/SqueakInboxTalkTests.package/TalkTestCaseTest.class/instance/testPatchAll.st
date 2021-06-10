tests - patching
testPatchAll

	| objects |
	objects := {Object new. {Object new}. Object new -> Object new}.
	
	self
		patchAll: objects
		at: #sitPatchedMessage
		withValue: 42
		during: [objects do: [:object | self assert: 42 equals: object sitPatchedMessage]].
	
	objects do: [:object | self should: [object sitPatchedMessage] raise: MessageNotUnderstood]