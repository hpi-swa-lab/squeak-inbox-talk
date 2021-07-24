private
partSearchers
	"Split the receiver into many copies representing the different query parts of the current term. Used for object-oriented recursion."

	^ self partTerms collect: [:partTerm |
		self copy
			hasComplexTerm: false;
			newTerm: partTerm;
			yourself]