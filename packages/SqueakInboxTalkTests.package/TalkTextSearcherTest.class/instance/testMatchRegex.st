tests - matching
testMatchRegex

	searcher doUseRegex.
	^ self
		testText: 'Hello World, this is a test. Carpe Squeak, the best in the world of all worlds!'
		expectedMatches:
			#(('w[a-z]+' #(#(false false #(#(7 5) #(60 5) #(73 6))) #(false true #(#(7 5) #(60 5) #(73 6))) #(true false #(#(60 5) #(73 6))) #(true true #(#(60 5) #(73 6)))))
			('w.+d' ((false false ((7 71))) (false true ((7 58))) (true false ((60 18))) (true true ((60 5))))))