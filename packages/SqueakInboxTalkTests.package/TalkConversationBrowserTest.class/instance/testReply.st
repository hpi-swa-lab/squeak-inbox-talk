tests
testReply

	| message editor |
	message := browser messages last.
	browser selectMessage: message.
	editor := self should: [browser reply] open: MailComposition.
	
	self assert: (editor messageRecipient includesSubstring: browser inbox mailAddress).
	self assert: (editor messageText asString includesSubstring: message text asString lines first)