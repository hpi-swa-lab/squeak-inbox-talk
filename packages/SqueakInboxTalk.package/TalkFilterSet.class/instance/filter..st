filtering
filter: conversations

	^ (self activeFilters sorted: [:filter | filter worstCaseCost] ascending)
		inject: conversations
		into: [:filteredConversations :filter | filter filter: filteredConversations]