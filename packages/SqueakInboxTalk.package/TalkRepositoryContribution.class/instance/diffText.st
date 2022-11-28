accessing - messages
diffText

	self conversations ifNotEmpty: [ | text diffStart diffEnd summaryStart |
		"Optimized. Otherwise, a regex would have been nicer, of course."
		text := self initialMessage text.
		summaryStart := (text findString: '==================== Summary ====================') + 49.
		diffStart := text findString: '===============' startingAt: summaryStart.
		diffStart = 0 ifTrue: [^ nil].
		diffEnd := text
			indexOfAnyOf: String crlf
			startingAt: diffStart.
		^ (text allButFirst: diffEnd) withBlanksTrimmed].
	
	^ nil