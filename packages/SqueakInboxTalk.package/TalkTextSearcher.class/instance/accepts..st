filtering
accepts: aConversation

	self isActive ifFalse: [^ true].
	
	^ self fullyMatches: aConversation