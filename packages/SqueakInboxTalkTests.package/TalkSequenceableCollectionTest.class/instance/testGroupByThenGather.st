tests - enumerating
testGroupByThenGather

	| collection expected result |
	collection := #(1 2 3 4 5 6 7 8 9 10).
	expected := #(1 3 10 2 4 5 7 6 8 9).
	
	result := collection
		talkGroupBy: [:ea | ea asWords first]
		thenGather: [:group | group sorted: [:ea | ea asWords atLast: 2] ascending, [:ea | ea asWords last] ascending].
	
	self assert: expected equals: result