updating
updateMessagesFor: aDuration

	self now ifNil: [
		fetchedMails := fetchedConversations := #().
		^ self].
	
	fetchedMails := self allMails select: [:mail | self now - mail date <= aDuration].
	fetchedConversations := self allConversations
		collect: [:conversation |
			conversation copy
				mails: (conversation mails intersection: fetchedMails);
				yourself]
		thenSelect: [:conversation | conversation mails notEmpty]