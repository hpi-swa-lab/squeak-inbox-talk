preferences
shouldIncludeSmartSummary
	<preference: 'Smart summaries for Squeak Inbox Talk (experimental)' category: #'Squeak Inbox Talk' description: 'Display AI-generated summaries for each conversation. Requires an OpenAI token and the SemanticText package to be installed.' type: #Boolean>

	^ ShouldIncludeSmartSummary ifNil: [true]