accessing
diffText

	self conversations ifNotEmpty: [ | text diffEnd summaryStart |
		"Optimized. Otherwise, a regex would have been nicer, of course."
		text := self message text.
		summaryStart := (text findString: '==================== Summary ====================') + 49.
		diffEnd := text
			indexOfAnyOf: String crlf
			startingAt: (text findString: '===============' startingAt: summaryStart).
		^ (text allButFirst: diffEnd) withBlanksTrimmed].
	
	^ nil