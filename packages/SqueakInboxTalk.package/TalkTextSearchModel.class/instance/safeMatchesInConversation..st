matching and filtering
safeMatchesInConversation: aConversation

	^ self doSafely: [self searcher matchesInConversation: aConversation] ifError: [#()]