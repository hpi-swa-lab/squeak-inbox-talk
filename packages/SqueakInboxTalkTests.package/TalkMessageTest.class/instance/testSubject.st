tests
testSubject

	| message |
	message := self classUnderTest new.
	
	self
		patch: message at: #inbox withValue: (self patchNewAt: #name withValue: 'my-list');
		patch: message inbox at: #subjectPrefix withValue: '[My-list] ';
		patch: message
			at: #mail
			withValue: (self patchNewAt: #subject withValue: '[my-list] foo bar ').
	
	self assert: 'foo bar' equals: message subject