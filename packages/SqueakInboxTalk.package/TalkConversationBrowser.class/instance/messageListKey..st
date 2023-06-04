toolbuilder
messageListKey: aCharacter

	| message |
	message := self selectedMessage ifNil: [self conversation].
	aCharacter
		caseOf:
			{[$A] -> [self browseAttachments].
			
			[$i] -> [message inspect].
			[$I] -> [message explore]}
		otherwise: [^ false].
	^ true