*SqueakInboxTalkExtras-Semantics-Core
initializeSemanticCorpus

	SemanticText assureSearchAvailableOr: [:requirements |
		TalkSemanticModelNotReady new
			featureName: 'semantic search';
			requirements: requirements;
			signal].
	
	self messages size > 100 ifTrue:
		["we would use #inform: but that is not thread-safe"
		self notify: 'Initialize semantic corpus now? This may take a while.'
			, '\\NOTE: If the Proceed is disabled, press Debug then Proceed.' withCRs.
		self flag: #workaround "https://github.com/squeak-smalltalk/squeak-object-memory/issues/92"].
	
	^ TalkSemanticCorpus createForInbox: self