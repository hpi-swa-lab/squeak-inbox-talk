private
partSearchers

	^ self partTerms collect: [:partTerm |
		self copy
			hasComplexTerm: false;
			newTerm: partTerm;
			yourself]