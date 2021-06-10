support
mailingListNamed: name address: address mails: mailBlock conversations: conversationBlock

	| list |
	list := TalkMockMailingList new
		name: name;
		mailAddress: address;
		yourself.
	
	list allMails: (mailBlock cull: list).
	list allConversations: (conversationBlock cull: list cull: list allMails).
	list allMails do: [:mail |
		mail
			at: #conversation
			put: (list allConversations detect: [:conversation | conversation mails includes: mail]).
		self patch: mail at: #hash withValue: UUID new hash
		"avoid infinite hash loops"].
	
	list updateMessagesFor: 0 seconds.
	
	^ list