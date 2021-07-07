private
partSearchers

	^ self partTerms collect: [:term |
		self copy
			hasComplexTerm: false;
			newTerm: term;
			yourself]