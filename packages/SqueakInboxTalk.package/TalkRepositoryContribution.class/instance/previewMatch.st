searching
previewMatch

	^ TalkTextSearcher
		pseudoMatchFor: self shortSummary
		from: self
		label: ('{1} ({2})' format: {self versionName. self state})