tests - testing
testBeginsWithCaseSensitive

	self assert: ('Abcde' talkBeginsWith: 'Abc' caseSensitive: true).
	self deny: ('Abcde' talkBeginsWith: 'abc' caseSensitive: true).
	self deny: ('Abcde' talkBeginsWith: 'Abx' caseSensitive: true).
	
	self assert: ('Abcde' talkBeginsWith: 'Abc' caseSensitive: false).
	self assert: ('Abcde' talkBeginsWith: 'abc' caseSensitive: false).
	self deny: ('Abcde' talkBeginsWith: 'Abx' caseSensitive: false)