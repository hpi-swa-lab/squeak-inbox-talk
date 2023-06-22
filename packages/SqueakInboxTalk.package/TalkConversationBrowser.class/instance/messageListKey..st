toolbuilder
messageListKey: aCharacter

	| message |
	self hasSpecialMessageSelected ifTrue: [^ false].
	message := self selectedMessage ifNil: [self conversation].
	aCharacter
		caseOf:
			{[$A] -> [self browseAttachments].
			
			[$i] -> [message inspect].
			[$I] -> [message explore]}
		otherwise: [^ false].
	^ true