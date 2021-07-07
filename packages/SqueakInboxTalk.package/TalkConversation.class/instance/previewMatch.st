accessing
previewMatch

	self contributions size = 1 ifTrue: [^ self contributions first previewMatch].
	
	^ TalkTextSearcher pseudoMatchFor: (self initialMessage text truncateWithElipsisTo: 100) from: self label: nil