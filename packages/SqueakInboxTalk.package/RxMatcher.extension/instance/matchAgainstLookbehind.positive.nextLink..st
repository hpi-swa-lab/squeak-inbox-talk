*SqueakInboxTalk-Core-matching-Regex-Core-ct.60-override
matchAgainstLookbehind: lookbehind positive: positive nextLink: anRmxLink

	| position matchesLookbehind |
	position := stream position.
	matchesLookbehind := (position to: 0 by: -1)
		anySatisfy: [:index |
			stream position: index.
			(lookbehind matchAgainst: self)
				and: [stream position = position]].
	stream position: position.
	matchesLookbehind = positive
		ifFalse: [^ false].
	^ anRmxLink matchAgainst: self