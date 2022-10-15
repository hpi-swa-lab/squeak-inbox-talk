accessing - messages
messageText

	self conversations ifNotEmpty: [ | text diffStart summaryEnd |
		"Optimized. Otherwise, a regex would have been nicer, of course."
		text := self initialMessage text.
		summaryEnd := text indexOfAnyOf: String crlf startingAt: (text findString: 'Ancestors: ').
		diffStart := text findString: '===============' startingAt: summaryEnd.
		diffStart = 0 ifTrue: [diffStart := text size].
		^ (text copyFrom: summaryEnd to: diffStart - 1) withBlanksTrimmed].
	
	^ super shortSummary