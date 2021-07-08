matching - private
matchesForBitap: term in: aString

	^ Generator talkStream: [:block |
		aString
			bitapSearch: term
			hammingDistance: 5
			matchesDo: [:start :stop | block value: (start to: stop)]]