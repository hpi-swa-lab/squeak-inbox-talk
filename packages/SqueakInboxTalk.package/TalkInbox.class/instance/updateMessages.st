updating
updateMessages

	self mailingList updateMessagesFor: self downloadRange.
	
	"Reset caches"
	conversationsPerContributions := nil