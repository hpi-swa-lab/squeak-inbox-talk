private
mergeOverlappingMatches: matches

	^ Generator on: [:gen | | mergedMatch |
		mergedMatch := nil.
		matches do: [:match |
			mergedMatch := mergedMatch ifNil: [match] ifNotNil: [
				(match start > mergedMatch stop and: [((match contents copyFrom: mergedMatch stop + 1 to: match start - 1) asString occurrencesOfRegex: '[\r\n]') > (self numberOfSurroundingLines + self numberOfSeparatingLines)])
					ifTrue: [
						gen yield: mergedMatch.
						match]
					ifFalse: [mergedMatch mergedWith: match]]].
		mergedMatch ifNotNil: [gen yield: mergedMatch]]