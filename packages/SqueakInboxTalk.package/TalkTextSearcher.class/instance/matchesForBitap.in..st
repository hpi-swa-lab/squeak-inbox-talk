matching - private
matchesForBitap: term in: aString

	self matchesWholeWord ifTrue: [
		^ (self copy
			matchesWholeWord: false;
			matchesForBitap: (' {1} ' format: {term}) in: aString) collect: [:match | match start + 1 to: match stop - 1]].
	
	^ Generator talkStream: [:block |
		aString
			bitapSearch: term
			hammingDistance: self bitapHammingDistance
			matchesDo: [:start :stop | block value: (start to: stop)]]