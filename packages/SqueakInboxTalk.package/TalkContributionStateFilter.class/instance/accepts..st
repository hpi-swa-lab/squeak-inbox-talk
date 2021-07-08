filtering
accepts: aConversation

	^ aConversation hasContributions ==> [self states includes: aConversation contributionState]