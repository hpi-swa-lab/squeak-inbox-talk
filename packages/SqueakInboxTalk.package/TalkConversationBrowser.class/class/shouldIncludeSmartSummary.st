preferences
shouldIncludeSmartSummary
	<preference: 'Enable smart summary (experimental)' category: #'Squeak Inbox Talk' description: 'Display AI-generated summaries for each conversation. Requires an OpenAI token and the ChatGPT package to be installed.' type: #Boolean>

	^ ShouldIncludeSmartSummary ifNil: [false]