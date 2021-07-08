filtering
accepts: aConversation

	^ aConversation contributions anySatisfy: [:contribution | self acceptsContribution: contribution]