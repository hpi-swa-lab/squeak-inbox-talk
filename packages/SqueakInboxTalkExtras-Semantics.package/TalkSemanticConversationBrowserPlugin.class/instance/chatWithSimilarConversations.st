actions
chatWithSimilarConversations

	^ SemanticConversation newStreaming
		addSystemMessage: 'Read the following conversations on the Squeak mailing list, squeak-dev, and prepare to summarize them for answering a question:';
		addUserMessage: ((similarConversations collect: [:ea | '```{1}```' format: {ea fullTextForSummary}]) joinSeparatedBy: String cr, String cr);
		addSystemMessage: 'The following message has been posted later on squeak-dev. Please read it to find out if any of the provided conversations from above are relevant to the new message:';
		addUserMessage: self conversation fullTextForSummary;
		addSystemMessage: 'Briefly summarize each of the older conversations in the context of the new message. Each summary must be exactly one short sentence. Write each sentence on a new line and start each line with the subject of the original conversation. Focus on the outcomes of each conversation (i.e., gained insights/implemented code changes/unresolved issues) and not so much on people.';
		addAssistantMessage: 'What would you like to know?';
		open