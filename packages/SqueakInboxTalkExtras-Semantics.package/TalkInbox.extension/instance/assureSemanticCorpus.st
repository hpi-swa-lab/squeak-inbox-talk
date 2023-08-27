*SqueakInboxTalkExtras-Semantics-Core
assureSemanticCorpus

	^ self semanticCorpus ifNil: [TalkSemanticCorpusNotInitialized signalFor: self]