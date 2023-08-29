tests - matching
testMatchWildcard

	searcher doMatchWildcard.
	^ self
		testText: 'Hello World, this is a test. Carpe Squeak, the best in the world of all worlds!'
		expectedMatches:
			#(('w*d' ((false false ((7 5) (60 5) (73 5))) (false true ((7 5) (60 5))) (true false ((60 5) (73 5))) (true true ((60 5)))))
			('wor#d' ((false false ((7 5) (60 5) (73 5))) (false true ((7 5) (60 5))) (true false ((60 5) (73 5))) (true true ((60 5))))))