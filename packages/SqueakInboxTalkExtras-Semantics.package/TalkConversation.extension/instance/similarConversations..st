*SqueakInboxTalkExtras-Semantics-Core
similarConversations: number

	^ self inbox assureSemanticCorpus
		findConversations: number
		similarToObject: self