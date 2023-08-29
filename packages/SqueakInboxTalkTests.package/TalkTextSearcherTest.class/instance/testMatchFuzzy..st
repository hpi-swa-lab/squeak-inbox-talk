tests - matching
testMatchFuzzy: strategy

	searcher matchStrategy: strategy.
	^ self
		testText: 'Hello SMALLTALKworld, this is a test. Carpe Squeak, the best in the smalltalkworld of all smalltalkwirlds!'
		expectedMatches:
			#(('smalltalkworld' #(#(false false #(#(7 15) #(69 14) #(91 16))) #(false true #(#(7 15) #(69 14))) #(true false #(#(69 14) #(91 16))) #(true true #(#(69 14))))))