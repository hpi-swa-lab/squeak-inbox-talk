accessing - messages
messageText

	self conversations ifNotEmpty: [ | text summaryStart summaryEnd diffStart |
		"Optimized. Otherwise, a regex would have been nicer, of course."
		text := self initialMessage text.
		summaryStart := text findString: 'Ancestors: '.
		summaryStart = 0 ifTrue: [^ text].
		summaryEnd := text indexOfAnyOf: String crlf startingAt: summaryStart.
		diffStart := text findString: '===============' startingAt: summaryEnd.
		diffStart = 0 ifTrue: [diffStart := text size].
		^ (text copyFrom: summaryEnd to: diffStart - 1) withBlanksTrimmed].
	
	^ super shortSummary