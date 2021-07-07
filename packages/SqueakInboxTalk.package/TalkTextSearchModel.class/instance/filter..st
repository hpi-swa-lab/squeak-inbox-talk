matching and filtering
filter: conversations

	^ self doSafely: [self searcher filter: conversations] ifError: [#()]