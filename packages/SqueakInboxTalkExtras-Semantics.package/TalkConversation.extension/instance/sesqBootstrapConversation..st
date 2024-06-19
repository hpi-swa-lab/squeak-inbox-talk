*SqueakInboxTalkExtras-Semantics-Core-SemanticSqueak
sesqBootstrapConversation: aConversation

	| eval |
	super sesqBootstrapConversation: aConversation.
	
	eval := aConversation defaultToolSpec toolNamed: 'eval'.
	
	(aConversation addAssistantMessage: '')
		toolCalls:
			{eval asToolCallWithArguments: {'"`self` represents a mailing list conversation. Let me take a look at the messages in the conversation."
self messages collect: [:message | message fullTextForSummary]'}}.
	aConversation resolveAllToolCalls.