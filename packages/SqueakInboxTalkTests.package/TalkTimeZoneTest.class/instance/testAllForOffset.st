tests
testAllForOffset

	self assert: ((self classToBeTested talkAllForOffset: 0 hours) collect: #abbreviation) = #('UTC' 'GMT').
	self assert: (self classToBeTested talkAllForOffset: -14 hours) isEmpty.