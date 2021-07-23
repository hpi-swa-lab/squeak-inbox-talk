tests - matching
testMatchFuzzy: strategy

	| text |
	text := 'Hello SMALLTALKworld, this is a test. Carpe Squeak, the best in the smalltalkworld of all smalltalkwirlds!'.
	searcher matchStrategy: strategy.
	
	#(#(false false #(#(7 15) #(69 14) #(91 16))) #(false true #(#(7 15) #(69 14))) #(true false #(#(69 14) #(91 16))) #(true true #(#(69 14)))) talkSpecsDo: [:matchesCase :matchesWholeWord :matchPositions |
		searcher
			matchesCase: matchesCase;
			matchesWholeWord: matchesWholeWord.
		searcher newTerm: 'smalltalkworld'.
		self
			assert: (matchPositions collect: [:pair | pair first to: pair first + pair second - 1])
			equals: ((searcher matchesInText: text) collect: [:match | match interval]) contents]