private
mergeOverlappingMatches: matches
	"Merge all overlapping matches from the argument that are in close enough proximity of each other to be displayed in a common result excerpt. Still maintaining the lazy nature of generator streams."

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