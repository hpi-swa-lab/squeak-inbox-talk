private
doSafely: aBlock ifError: exceptionBlock

	^ aBlock on: self searcher errors do: [:ex |
		searchError := ex tag: aBlock.
		self annotateSearchTermWith: ex.
		Project current addDeferredUIMessage: [
			self
				changed: #searchTerm;
				changed: #hasSearchError].
		exceptionBlock value]