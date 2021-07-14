matching
matchesIn: aStringOrText from: anObject label: label isLabelSearchable: aBoolean

	^ self partSearchers talkAsGenerator gather: [:searcher | searcher basicMatchesIn: aStringOrText from: anObject label: label isLabelSearchable: aBoolean]