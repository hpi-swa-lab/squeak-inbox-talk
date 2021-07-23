accessing
previewMatch

	^ TalkTextSearcher
		pseudoMatchFor: (self text truncateWithElipsisTo: 100)
		from: self
		label: nil