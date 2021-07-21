filtering
accepts: aConversation

	self isActive ifFalse: [^ true].
	
	^ self predicateBlock value: aConversation