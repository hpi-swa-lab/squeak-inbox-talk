tests
testPrintString

	| project |
	project := self classUnderTest new.
	self patch: project at: #name to: ['ProjectX'].
	
	self assert: ('a {1}<ProjectX>' format: {self classUnderTest name}) equals: project printString