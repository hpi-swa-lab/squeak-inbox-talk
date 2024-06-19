private
idForConversation: aConversation

	| messageId |
	messageId := aConversation initialMessage messageId.
	self assert: ((messageId beginsWith: '<') and: [messageId endsWith: '>']).
	^ 'mid:' , messageId allButFirst allButLast