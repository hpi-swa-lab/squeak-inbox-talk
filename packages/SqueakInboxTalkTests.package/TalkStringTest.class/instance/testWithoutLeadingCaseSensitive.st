tests - converting
testWithoutLeadingCaseSensitive

	self assert: 'bcde' equals: ('bcde' talkWithoutLeading: 'abc' caseSensitive: true).
	self assert: 'Abcde' equals: ('Abcde' talkWithoutLeading: 'abc' caseSensitive: true).
	self assert: 'de' equals: ('Abcde' talkWithoutLeading: 'Abc' caseSensitive: true).
	
	self assert: 'bcde' equals: ('bcde' talkWithoutLeading: 'abc' caseSensitive: false).
	self assert: 'de' equals: ('Abcde' talkWithoutLeading: 'abc' caseSensitive: false).
	self assert: 'de' equals: ('Abcde' talkWithoutLeading: 'Abc' caseSensitive: false)