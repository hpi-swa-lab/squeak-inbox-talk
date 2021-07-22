filtering
accepts: aConversation

	self isActive ifFalse: [^ true].
	
	^ aConversation contributions anySatisfy: [:contribution | self acceptsContribution: contribution]