handling
defaultAction

	self class suppressed ifTrue: [
		Transcript showln: self printString.
		^ nil].
	^ super defaultAction