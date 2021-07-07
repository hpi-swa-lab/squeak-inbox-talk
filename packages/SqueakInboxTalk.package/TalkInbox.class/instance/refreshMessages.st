updating
refreshMessages

	self mailingList updateMessagesFor: self downloadRange.
	self projects do: #refreshVersions.
	
	"Reset caches"
	conversationsPerContributions := nil.
	messagesPerContributions := nil.