tests - matching
testMatchRegex

	| text |
	text := 'Hello World, this is a test. Carpe Squeak, the best in the world of all worlds!'.
	searcher doUseRegex.
	
	#(#(false false #(#(7 5) #(60 5) #(73 6))) #(false true #(#(7 5) #(60 5) #(73 6))) #(true false #(#(60 5) #(73 6))) #(true true #(#(60 5) #(73 6)))) talkSpecsDo: [:matchesCase :matchesWholeWord :matchPositions |
		searcher
			matchesCase: matchesCase;
			matchesWholeWord: matchesWholeWord.
		searcher newTerm: 'w[a-z]+'.
		self
			assert: (matchPositions collect: [:pair | pair first to: pair first + pair second - 1])
			equals: ((searcher matchesInText: text) collect: [:match | match interval]) contents]