self-updating
ensureSemanticTextOrCancel

	(Smalltalk classNamed: #SemanticText) ifNotNil: [:class | ^ class].
	(self confirm: 'Install SemanticText?') ifFalse: [^ nil].
	self metacello installSemanticText.
	^ Smalltalk classNamed: #SemanticText