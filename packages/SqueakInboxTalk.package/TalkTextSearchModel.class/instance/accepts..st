matching and filtering
accepts: aConversation

	^ self doSafely: [self searcher accepts: aConversation] ifError: [false]