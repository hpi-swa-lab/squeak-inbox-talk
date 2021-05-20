accessing
gistToken

	^ (self environment classNamed: #SmalltalkCI)
		ifNil: [self environment at: #SITGistToken]
		ifNotNil: [:sci | sci getEnv: (#SITGistToken findFeatures joinSeparatedBy: $_) asUppercase]