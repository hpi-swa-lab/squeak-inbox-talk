tests
testSubject

	| message |
	message := self classUnderTest new.
	
	self
		patch: message at: #inbox withValue: (self patch: Object new at: #name withValue: 'my-list');
		patch: message at: #mail withValue: (self patch: Object new at: #subject withValue: '[my-list] foo bar ').
	
	self assert: 'foo bar' equals: message subject