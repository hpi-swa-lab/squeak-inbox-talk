accessing - toolbuilder
matchesRegex: aBoolean

	aBoolean ifFalse: [^ self matchesExact: true].
	
	self doUpdate: [
		self matchesRegex ifFalse: [
			self flag: #discuss.
			"Is this helpful or confusing?"
			searchTermDraft := self searchTerm escapeRegex].
		self searcher doUseRegex].
	self changed: #matchesRegex