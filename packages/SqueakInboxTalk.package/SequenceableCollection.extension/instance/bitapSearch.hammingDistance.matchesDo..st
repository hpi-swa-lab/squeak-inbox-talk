*SqueakInboxTalk-Filters-comparing
bitapSearch: pattern hammingDistance: maxDistance matchesDo: aBlock

	| patternMasks patternSize rs |
	pattern ifEmpty: [^ self].
	patternSize := pattern size.
	patternSize > 31 ifTrue: [^ self error: 'search string to long!'].
	
	rs := Array new: maxDistance + 1 withAll: 1 bitInvert.
	patternMasks := Array new: 256 withAll: 0 bitInvert.
	pattern withIndexDo: [:char :index |
		patternMasks
			at: char asciiValue
			put: ((patternMasks at: char asciiValue) bitAnd: (2 bitShift: index - 2) bitInvert)].
	
	self withIndexDo: [:char :index | | oldR |
		oldR := rs at: 1.
		rs at: 1 put: (((rs at: 1) bitOr: (patternMasks at: char asciiValue)) bitShift: 1).
		1 to: maxDistance do: [:distance | | tmp |
			tmp := rs at: distance + 1.
			rs
				at: distance + 1
				put: ((oldR bitAnd: ((rs at: distance + 1) bitOr: (patternMasks at: char asciiValue))) bitShift: 1).
			oldR := tmp].
		((rs at: maxDistance) bitAnd: (2 bitShift: patternSize - 1)) = 0 ifTrue: [aBlock value: index - patternSize + 1 value: index]]