matching and filtering
safeMatchesIn: talkObject

	^ self doSafely: [self searcher matchesIn: talkObject] ifError: [#()]