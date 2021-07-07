testing
includesAuthor: aPerson

	^ (self contributions copyWith: self initialMessage) anySatisfy: [:contribution | contribution wasAuthoredBy: aPerson]