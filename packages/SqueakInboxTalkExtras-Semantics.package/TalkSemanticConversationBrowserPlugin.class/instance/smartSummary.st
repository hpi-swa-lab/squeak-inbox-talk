private
smartSummary

	| fullText |
	SemanticText assureConversationAvailableOr: [:requirements |
		TalkSemanticModelNotReady new
			featureName: 'smart summaries';
			requirements: requirements;
			signal].
	
	fullText := self conversation fullTextForSummary.
	
	smartSummaryConversation := SemanticConversation new.
	smartSummaryConversation in: [:conversation |
		SemanticText registeredConversationModels
			detect: [:model | model name = OpenAIConversationModel cheapestName]
			ifFound: [:model | conversation model: model]].
	smartSummaryConversation config: self class semanticConversationConfig.
	self changed: #smartSummaryHeader.
	^ smartSummaryConversation
		addSystemMessage: 'Briefly summarize this thread on the squeak-dev mailing list. If the thread is trivial and you can put it in a single sentence, perfect. Otherwise, use the following scheme:

1. Problem statement
2. Observations, arguments, and suggestions
3. Action items (i.e., need for further discussion, X is working on a fix, expecting further details from Y, ...)

For each section, provide 1-5 bullet points (less is better). Be very brief, short phrases are absolutely fine. Focus on technical stuff and arguments but less on people and not on boring communication flows. Stay high-level and do not dive into technical details if there are many. You may emphasize key phrases in bold.';
		addUserMessage: fullText;
		getAssistantMessage