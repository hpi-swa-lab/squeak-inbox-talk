tests - matching
testMatchBitap
	<resumable>

	| text |
	text := 'Hello WORLD, this is a test. Carpe Squeak, the best in the world of all wirlds!'.
	searcher matchStrategy: #bitap.
	
	#(#(false false #(#(7 5) #(60 5) #(73 5))) #(false true #(#(7 5) #(60 5))) #(true false #(#(60 5) #(73 5))) #(true true #(#(60 5)))) talkSpecsDo: [:matchesCase :matchesWholeWord :matchPositions |
		searcher
			matchesCase: matchesCase;
			matchesWholeWord: matchesWholeWord.
		searcher newTerm: 'world'.
		self
			assert: (matchPositions collect: [:pair | pair first to: pair first + pair second - 1])
			equals: ((searcher matchesIn: text) collect: [:match | match interval]) contents]