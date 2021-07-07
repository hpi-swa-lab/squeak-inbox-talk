matching - private
tokensFor: term in: aString select: aBlock

	^ Generator on: [:gen |
		aString findTokens: Character separators indicesDo: [:start :stop | | prefix |
			prefix := (aString copyFrom: start to: stop) take: term size.
			(aBlock value: prefix) ifTrue: [gen yield: (start to: stop)]]]