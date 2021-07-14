initialize-release
defaultPredicateString

	latestPredicateString ifNotNil: [^ latestPredicateString].
	^ (self predicateStringFor: self defaultPredicate), '\"weekend squeakers"' withCRs