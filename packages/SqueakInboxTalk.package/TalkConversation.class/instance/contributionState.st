accessing
contributionState

	self contributions ifEmpty: [^ nil].
	
	(self contributions anySatisfy: [:contribution | contribution state = #pending]) ifTrue: [^ #pending].
	(self contributions allSatisfy: [:contribution | contribution state = #treated]) ifTrue: [^ #treated].
	(self contributions anySatisfy: [:contribution | contribution state = #merged]) ifTrue: [^ #merged].
	(self contributions anySatisfy: [:contribution | contribution state = #trunk]) ifTrue: [^ #trunk].
	
	^ nil