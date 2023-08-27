private
resetCaches

	conversationsPerContributions := nil.
	messagesPerContributions := nil.
	messagesPerIds := nil.
	lastRefreshed := nil.
	
	self flag: #optimize. "some indices (at least messagesPerIds) could be updated more efficiently if we had a list of new messages to add them"