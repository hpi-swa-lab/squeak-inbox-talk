filtering
accepts: aConversation

	^ (self activeFilters sorted: [:filter | filter worstCaseCostFor: aConversation] ascending) allSatisfy: [:filter | filter accepts: aConversation]