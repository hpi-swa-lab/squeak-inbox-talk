preferences
shouldStreamSmartSummary
	<preference: 'Stream smart summaries (experimental)' category: #'Squeak Inbox Talk' description: 'If enabled, smart summaries will appear incrementally.' type: #Boolean>

	^ self shouldIncludeSmartSummary and: [self semanticConversationConfig shouldStream]