private
annotateText: aText withAttributes: matchAttributes offset: offset

	self allOriginalMatches do: [:originalMatch |
		aText
			addAllAttributes: ((matchAttributes respondsTo: #value:)
				ifTrue: [matchAttributes value: originalMatch]
				ifFalse: [matchAttributes])
			from: originalMatch start + offset
			to: originalMatch stop + offset]