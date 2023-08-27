accessing - state
currentText

	self hasSpecialMessageSelected ifTrue: [^ self text].
	
	searchModel hasSearchError ifTrue: [^ searchModel debuggableErrorText].
	
	^ self annotateMatchesIn: (self text ifNil: [^ nil])