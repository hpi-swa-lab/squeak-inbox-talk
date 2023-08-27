tests
testMessageForIdPlaceholder

	| inbox placeholder message |
	inbox := self classUnderTest new.
	self patch: inbox at: #name withValue: self asString , UUID new.
	self patch: inbox at: #messages withValue: OrderedCollection new.
	self
		patch: inbox at: #mailingList withValue: (self patch: Object new at: #updateMessagesFor: with: [:downloadRange |]);
		patch: inbox at: #projects withValue: #().
	
	placeholder := (inbox messageForId: 43).
	self assert: placeholder isPlaceholder.
	self assert: 43 equals: placeholder messageId.
	
	"After refreshing, placeholders have to be resolved"
	message := self patch: Object new at: #messageId withValue: 43.
	self patch: message at: #isPlaceholder withValue: false.
	inbox messages add: message.
	inbox refreshMessages.
	
	self assert: message equals: (inbox messageForId: 43).
	self assert: message identical: placeholder.
	self deny: placeholder isPlaceholder.