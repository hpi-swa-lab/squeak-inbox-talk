functions
getRecentConversations: days
	"
	self new getRecentConversations: 3
	"
	<function: getRecentConversations
		"Get and summarize recent conversations on the mailing list."
		(
			days: number
		)
	>

	| startDate conversations chunks summaryConversation chunkSummaries |
	startDate := DateAndTime today - days days.
	conversations := self inbox conversations select: [:conversation | conversation latestDate >= startDate].
	chunks := conversations chunksOf: 20.
	summaryConversation := SemanticConversation new
		addSystemMessage: 'Summarize the following conversations on the squeak-dev mailing list. For each conversation, output a brief summary in one sentence up to one paragraph. Each paragraph should have max. 200 words, but never be longer than the full conversation.
Return all summaries in a JSON object of the form {"summaries":[{"id":"id1","summary":"summary 1"},...]} with an array of the same size as the input array.';
		withConfigDo: [:config |
			config temperature: 0.
			config openAIRawConfig response_format: (JsonObject new type: 'json_object'; yourself)];
		in: [:conversation |
			SemanticText registeredConversationModels
				detect: [:model | model name = OpenAIConversationModel cheapestName]
				ifFound: [:model | conversation model: model]];
		yourself.
	chunkSummaries := (chunks semanticConcurrentCollect: [:chunk |
		| result |
		result := (summaryConversation copy
			addUserMessage:
				(chunk collect: [:conversation |
					OrderedJsonObject new
						id: (self idForConversation: conversation);
						text: conversation fullTextForSummary;
						yourself])
							asJsonString;
			getAssistantReply)
				parseAsJson.
		result summaries collect: [:item |
			| conversation |
			conversation := self conversationForId: item id.
			OrderedJsonObject new
				subject: (conversation simpleSubject truncateWithEllipsisTo: 80);
				id: item id;
				summary: item summary;
				yourself]])
					gather: [:summaries | summaries].
	^ chunkSummaries