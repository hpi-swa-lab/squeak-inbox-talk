tests
testUrl

	self patch: project trunkRepository at: #talkLocation withValue: 'http://example.org/trunk'.
	
	self assert: 'http://example.org/trunk' equals: project url