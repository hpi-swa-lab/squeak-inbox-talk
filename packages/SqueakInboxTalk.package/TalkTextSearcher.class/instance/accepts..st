filtering
accepts: aConversation

	^ (self matchesInConversation: aConversation) talkIsEmpty not