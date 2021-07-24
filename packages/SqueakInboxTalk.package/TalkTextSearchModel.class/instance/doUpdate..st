private
doUpdate: aBlock

	| updateBlock |
	searchTermDraft := self searchTerm asString ifEmpty: [].
	self searcher basicTerm: nil.
	updateBlock := [self searcher newTerm: searchTermDraft].
	searchError := [
		aBlock value.
		updateBlock value.
		searchTermDraft := nil]
		on: self searcher errors
		do: [:ex |
			self annotateSearchTermWith: ex.
			ex tag: updateBlock].
	
	self changed: #searchTerm.
	self changed: #hasSearchError