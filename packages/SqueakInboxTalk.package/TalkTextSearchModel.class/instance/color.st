accessing - toolbuilder
color

	^ self searchError ifNotNil: [self errorColor] ifNil: [self normalColor]