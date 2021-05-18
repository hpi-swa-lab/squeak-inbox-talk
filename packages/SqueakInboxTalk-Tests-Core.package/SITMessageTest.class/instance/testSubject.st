tests
testSubject

	| message |
	message := self classUnderTest new.
	
	self
		patch: message at: #inbox toValue: (self patch: Object new at: #name toValue: 'my-list');
		patch: message at: #mail toValue: (self patch: Object new at: #subject toValue: '[my-list] foo bar ').
	
	self assert: 'foo bar' equals: message subject