functions
openResults: ids
	"
	self new openResults: #('<E1hWg2S-0007in-9a@andreas>')
	"
	<function: openResults
		"Open and read the search results for the specified IDs from a previous search.
		Example: exactSearchTerms = [""<E1hWg2S-0007in-9a@andreas>""]"
		(
			ids: {
				"type": "array",
				"items": {
					"type": "string"
				}
			}
		)
	>

	| conversations |
	conversations := ids collect: [:id | self conversationForId: id].
	
	^ (conversations collect: [:conversation |
		JsonObject new
			subject: (conversation simpleSubject truncateWithEllipsisTo: 80);
			id: conversation initialMessage messageId;
			text: conversation fullTextForSummary;
			yourself])
				asJsonString