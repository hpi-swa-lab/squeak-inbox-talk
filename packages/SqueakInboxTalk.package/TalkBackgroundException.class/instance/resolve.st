resolving
resolve

	^ [resolution isSymbol
		ifTrue: [self exception perform: resolution]
		ifFalse: [resolution cull: self exception]]
			ensure: [resolution := nil]