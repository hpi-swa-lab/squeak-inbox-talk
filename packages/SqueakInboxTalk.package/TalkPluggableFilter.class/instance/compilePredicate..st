compiling
compilePredicate: aString

	| compiledMethod |
	compiledMethod := Compiler new
		compiledMethodFor: aString
		in: self makeFilterContext
		to: nil
		notifying: nil
		ifFail: [^ false].
	compiledMethod properties at: #source put: aString.
	
	self predicate: compiledMethod.
	^ true