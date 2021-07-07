accessing - state
currentText

	^ searchModel annotateMatchesIn: (self text ifNil: [^ nil])