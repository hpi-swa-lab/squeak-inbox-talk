searching
previewMatch

	^ TalkTextSearcher
		pseudoMatchFor: self shortSummary
		from: self
		label: self versionNameWithState