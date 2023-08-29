matching - private
intervalsIn: aString
	"Yield an interval for every occurence of the current search term in aString. See #fuzzyStrategies for more information."

	| currentTerm currentString |
	self isActive ifFalse: [^ Generator on: [:gen | gen nextPut: (1 to: aString size)]].
	
	self usesRegex ifTrue: [^ self regexIntervalsIn: aString].
	
	self matchStrategy ifNil: [^ self intervalsForExact: term in: aString].
	
	currentTerm := self term.
	currentString := aString.
	self matchesCase ifFalse:
		[currentTerm := currentTerm asLowercase.
		currentString := currentString asLowercase].
	
	self matchStrategy = #wildcard ifTrue: [^ self intervalsForWildcard: currentTerm in: currentString].
	
	self matchStrategy = #bitap ifTrue: [^ self intervalsForBitap: currentTerm in: currentString].
	
	self matchesWholeWord ifTrue: [currentTerm := ' {1} ' format: {currentTerm}].
	^ self tokensFor: currentTerm in: currentString select: [:token |
		self matchStrategy caseOf: {
			[#levenshtein] -> [self matchesLevenshtein: currentTerm in: token].
			[#nGram] -> [self matchesNGram: currentTerm in: token].
			[#soundex] -> [self matchesSoundex: currentTerm in: token]}]