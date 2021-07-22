support
pseudoMatchFor: aStringOrText from: anObject label: label

	^ (self pseudoSearcher
		matchesInText: aStringOrText
		from: anObject
		label: label
		isLabelSearchable: true) next as: TalkTextSearcherPseudoMatch