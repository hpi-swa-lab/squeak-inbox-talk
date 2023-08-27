preferences
shouldStreamSmartSummary: aBoolean

	self shouldIncludeSmartSummary ifFalse: [^ self inform: 'Smart summaries are not enabled.'].
	self semanticConversationConfig shouldStream: aBoolean.