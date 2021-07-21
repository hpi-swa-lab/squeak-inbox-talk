tests - enumerating
testGroupSequentiallyByThenGather

	| collection expected result |
	collection := #(1 2 3 4 5 6 7 8 9 10).
	expected := #(#x 1 #x 2 3 #x 4 5 #x 6 7 #x 8 #x 9 #x 10).
	
	result := collection
		talkGroupSequentiallyBy: [:ea | ea asWords first]
		thenGather: [:group | group copyWithFirst: #x].
	
	self assert: expected equals: result