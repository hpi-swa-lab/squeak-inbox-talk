tests - filtering
testMessageTextSelector

	| filter message |
	message := TalkMessage new.
	self
		patch: message at: #searchableProperties withValue: #();
		patch: message at: #plainText withValue: 'plonk';
		patch: message at: #richText withValue: 'griffle'.
	
	filter := self classUnderTest new
		newTerm: 'plonk';
		yourself.
	
	filter messageTextSelector: #plainText.
	self assert: (filter accepts: message).
	
	filter messageTextSelector: #richText.
	self deny: (filter accepts: message).