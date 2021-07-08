private
doUpdate: aBlock

	searchTermDraft := self searchTerm asString ifEmpty: [].
	self searcher term: nil.
	searchError := [
		aBlock value.
		self searcher newTerm: searchTermDraft.
		searchTermDraft := nil]
		on: self searcher errors
		do: [:ex |
			self annotateSearchTermWith: ex.
			ex tag: [self searcher newTerm: searchTermDraft]].
	
	self changed: #searchTerm.
	self changed: #hasSearchError