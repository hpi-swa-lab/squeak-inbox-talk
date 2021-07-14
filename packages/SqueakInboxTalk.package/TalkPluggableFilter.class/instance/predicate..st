accessing
predicate: evaluable

	self predicateString ifNotNil: [:predicateString | latestPredicateString := predicateString].
	
	predicate := evaluable.
	
	self changed