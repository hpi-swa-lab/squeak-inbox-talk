matching and filtering
safeAnnotateMatchesIn: aStringOrText

	^ self
		doSafely: [self searcher annotateMatchesInText: aStringOrText withAttributes: self matchAttributes]
		ifError: [aStringOrText]