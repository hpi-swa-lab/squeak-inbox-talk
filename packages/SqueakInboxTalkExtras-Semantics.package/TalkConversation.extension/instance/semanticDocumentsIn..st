*SqueakInboxTalkExtras-Semantics-Core
semanticDocumentsIn: aCorpus

	^ self messages gather: [:message | aCorpus allDocumentsForObject: message]