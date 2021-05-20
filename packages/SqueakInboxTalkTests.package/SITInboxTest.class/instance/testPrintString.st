tests
testPrintString

	| inbox name |
	name := self asString.
	
	inbox := self classUnderTest new.
	self patch: inbox at: #name to: [name].
	
	self assert: ('a {1}<{2}>' format: {self classUnderTest name. name}) equals: inbox printString