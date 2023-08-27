preferences
enableSemanticSearch
	<preference: 'Semantic search in Squeak Inbox Talk (experimental)' category: #'Squeak Inbox Talk' description: 'Activate optional semantic and similarity search features, such as displaying similar conversations for the current conversation. Requires an OpenAI token and the SemanticText package to be installed.' type: #Boolean>

	^ EnableSemanticSearch ifNil: [false]