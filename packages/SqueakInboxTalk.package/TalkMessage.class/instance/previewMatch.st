searching
previewMatch

	^ TalkTextSearcher
		pseudoMatchFor: (self text asString truncateWithElipsisTo: 100)
		from: self
		label: nil