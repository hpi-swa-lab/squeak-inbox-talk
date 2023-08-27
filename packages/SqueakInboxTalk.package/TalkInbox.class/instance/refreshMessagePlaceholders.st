updating
refreshMessagePlaceholders

	messagePlaceholders ifNotNil: [
		messagePlaceholders keysAndValuesRemove: [:id :placeholder |
			placeholder tryToResolve isPlaceholder not]].