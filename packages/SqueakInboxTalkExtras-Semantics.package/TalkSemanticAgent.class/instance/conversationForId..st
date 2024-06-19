private
conversationForId: id

	| messageId |
	self assert: (id beginsWith: 'mid:').
	messageId := '<' , (id allButFirst: 4) , '>'.
	^ (self inbox messageForId: messageId) conversation