tests - matching
testMatchExact

	| text |
	text := 'Hello World, this is a test. Carpe Squeak, the best in the world of all worlds!'.
	searcher doMatchExact.
	
	#(('world' #(#(false false #(#(7 5) #(60 5) #(73 5))) #(false true #(#(7 5) #(60 5))) #(true false #(#(60 5) #(73 5))) #(true true #(#(60 5)))))
	('Hello' ((false false ((1 5))) (false true ((1 5)))))
	('Hel' ((false false ((1 3))) (false true ())))
	('aHe' ((false false ()) (false true ())))
	('worlds!' ((false false ((73 7))) (false true ((73 7)))))
	('s!' ((false false ((78 2))) (false true ())))
	('s!z' ((false false ()) (false true ()))))
		talkSpecsDo: [:term :specs |
			specs talkSpecsDo: [:matchesCase :matchesWholeWord :matchPositions |
				searcher
					matchesCase: matchesCase;
					matchesWholeWord: matchesWholeWord.
				searcher newTerm: term.
				self
					assert: (matchPositions collect: [:pair | pair first to: pair first + pair second - 1])
					equals: ((searcher matchesInText: text) collect: [:match | match interval]) contents]].