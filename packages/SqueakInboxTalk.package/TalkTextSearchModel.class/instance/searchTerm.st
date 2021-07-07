accessing - searcher
searchTerm

	^ searchTermDraft ifNil: [self searcher term ifNil: ['']]