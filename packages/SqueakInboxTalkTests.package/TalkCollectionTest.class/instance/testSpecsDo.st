*SqueakInboxTalkTests-Abstract-tests - enumerating
testSpecsDo

	self
		assert: #(1 2 3)
		equals: (Array streamContents: [:stream | #(#(1) #(2) #(3)) talkSpecsDo: [:a | stream nextPut: a]]).
	self
		assert: #(#(1 2) #(3 4))
		equals: (Array streamContents: [:stream | #(#(1 2) #(3 4)) talkSpecsDo: [:a :b | stream nextPut: {a. b}]]).
	self
		assert: #(#(1 2 3) #(4 5 6))
		equals: (Array streamContents: [:stream | #(#(1 2 3) #(4 5 6)) talkSpecsDo: [:a :b :c | stream nextPut: {a. b. c}]]).
	
	self should: [#(#(1 2 3) #(4 5)) talkSpecsDo: [:a :b :c | ]] raise: Error.
	self should: [#(#(1 2 3) #(4 5 6 7)) talkSpecsDo: [:a :b :c | ]] raise: Error