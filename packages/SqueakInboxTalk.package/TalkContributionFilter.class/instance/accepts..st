filtering
accepts: aConversation

	^ aConversation hasContributions
		ifTrue: [self withContributions]
		ifFalse: [self withoutContributions]