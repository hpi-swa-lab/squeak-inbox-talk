updating
refreshMessages

	self mailingList updateMessagesFor: self downloadRange.
	self projects do: #refreshVersions.
	
	self resetCaches.
	lastRefreshed := DateAndTime now