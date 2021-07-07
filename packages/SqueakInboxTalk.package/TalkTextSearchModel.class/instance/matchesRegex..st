accessing - toolbuilder
matchesRegex: aBoolean

	aBoolean ifFalse: [^ self matchesExact: true].
	
	self doUpdate: [
		self matchesRegex ifFalse: [
			"I found this rather confusing..."
			"searchTermDraft := self searchTerm escapeRegex"].
		self searcher doUseRegex].
	self changed: #matchesRegex