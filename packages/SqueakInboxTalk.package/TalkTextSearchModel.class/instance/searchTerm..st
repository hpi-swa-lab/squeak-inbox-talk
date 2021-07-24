accessing - searcher
searchTerm: aStringOrText

	| oldTerm |
	searchTermDraft := aStringOrText asString.
	oldTerm := self searcher term.
	self doUpdate: [self searcher basicTerm: oldTerm]