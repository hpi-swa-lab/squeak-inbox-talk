accessing - state
currentText

	searchModel hasSearchError ifTrue: [^ searchModel debuggableErrorText].
	
	^ self annotateMatchesIn: (self text ifNil: [^ nil])