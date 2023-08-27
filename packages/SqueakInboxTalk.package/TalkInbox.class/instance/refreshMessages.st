updating
refreshMessages

	self mailingList updateMessagesFor: self downloadRange.
	self projects do: #refreshVersions.
	
	self resetCaches.
	self refreshMessagePlaceholders.
	lastRefreshed := DateAndTime now.
	
	self triggerEvent: #refreshMessages.