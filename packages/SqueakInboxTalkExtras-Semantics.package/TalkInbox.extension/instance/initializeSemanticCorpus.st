*SqueakInboxTalkExtras-Semantics-Core
initializeSemanticCorpus

	self messages size > 100 ifTrue:
		["we would use #inform: but that is not thread-safe"
		self notify: 'Initialize semantic corpus now? This may take a while.'].
	
	^ TalkSemanticCorpus createForInbox: self