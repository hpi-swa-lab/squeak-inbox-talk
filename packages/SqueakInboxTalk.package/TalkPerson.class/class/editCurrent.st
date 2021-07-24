accessing
editCurrent

	^ self currentOrNil
		ifNil: [
			self
				current;
				currentOrNil]
		ifNotNil: [:person | person initializeInteractively]