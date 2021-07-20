tests
testPrintString

	| contribution |
	contribution := self classUnderTest new.
	contribution inbox: nil project: nil versionName: 'version-x'.
	
	self assert: ('a {1}<version-x>' format: {self classUnderTest name}) equals: contribution printString