filtering
accepts: aConversation

	self isActive ifFalse: [^ true].
	
	^ self fullyMatchesConversation: aConversation