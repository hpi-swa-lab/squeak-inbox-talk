matching - private
intervalsForExact: term in: aString

	^ Generator on: [:gen | | index |
		index := 0.
		[
			index := aString findString: term startingAt: index + 1 caseSensitive: self matchesCase.
			(index > 0 and: [self matchesWholeWord ==> [(index = 1 or: [(aString at: index - 1) isAlphaNumeric not]) and: [index + term size >= aString size or: [(aString at: index + term size) isAlphaNumeric not]]]])
				ifTrue: [gen yield: (index to: index + term size - 1)];
				yourself] whileTrue]