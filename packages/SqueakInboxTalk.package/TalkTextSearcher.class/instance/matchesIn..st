matching
matchesIn: aStringOrText

	^ self partSearchers talkAsGenerator gather: [:searcher | searcher basicMatchesIn: aStringOrText from: nil label: nil isLabelSearchable: false]