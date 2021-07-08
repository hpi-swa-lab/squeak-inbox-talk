accessing
shouldBeFiltered

	self deny: browser conversations isEmpty.
	self assert: browser conversations size < browser allConversations size