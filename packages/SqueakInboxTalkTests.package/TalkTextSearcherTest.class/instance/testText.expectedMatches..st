tests - matching
testText: text expectedMatches: termsAndExpectedMatches

	termsAndExpectedMatches talkSpecsDo: [:term :expectedMatches |
		expectedMatches talkSpecsDo: [:matchesCase :matchesWholeWord :matchPositions |
			searcher
				matchesCase: matchesCase;
				matchesWholeWord: matchesWholeWord.
			searcher newTerm: term.
			self
				assert: (matchPositions collect: [:pair | pair first to: pair first + pair second - 1])
				equals: ((searcher matchesInText: text) collect: [:match | match interval]) contents]].