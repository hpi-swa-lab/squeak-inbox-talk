accessing
gistToken

	^ (self environment classNamed: 'SmalltalkCI')
		ifNil: [self environment at: #SCIGistToken]
		ifNotNil: [:sci | sci getEnv: (#SCIGistToken findFeatures joinSeparatedBy: $_) asUppercase]