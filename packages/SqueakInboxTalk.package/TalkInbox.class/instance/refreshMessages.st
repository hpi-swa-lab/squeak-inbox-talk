updating
refreshMessages

	self mailingList updateMessagesFor: self downloadRange.
	self projects do: #refreshVersions.
	lastRefreshed := DateAndTime now.
	
	self resetCaches.
	self refreshMessagePlaceholders.
	
	self triggerEvent: #refreshMessages.