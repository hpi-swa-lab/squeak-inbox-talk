updating
aspectDependencies

	^ super aspectDependencies
		at: #similarConversationsText put: #(similarConversations);
		at: #smartSummaryText put: #(smartSummary);
		yourself