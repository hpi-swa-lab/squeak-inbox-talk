support
pseudoMatchFor: aStringOrText from: anObject label: label

	^ (self pseudoSearcher matchesIn: aStringOrText from: anObject label: label isLabelSearchable: true) next as: TalkTextSearcherPseudoMatch