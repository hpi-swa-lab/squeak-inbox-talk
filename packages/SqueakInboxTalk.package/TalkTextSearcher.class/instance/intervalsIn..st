matching - private
intervalsIn: aString
	"Yield an interval for every occurence of the current search term in aString."
	"Comparative observations:
	- BITAP - 7 sec, does not detect added/removed chars - 'proces-faitfhul debugging' not found
	- LEVENSHTEIN - 54 sec
	- NGRAMS - 51 sec
	- SOUNDEX - 13 sec, way too imprecise - 'process' sounds like 'project', 'baloon' like 'boolean'"

	| currentString currentTerm |
	self isActive ifFalse: [^ Generator on: [:gen | gen nextPut: (1 to: aString size)]].
	
	self usesRegex ifTrue: [^ self regexIntervalsIn: aString].
	
	self matchStrategy ifNil: [^ self intervalsForExact: term in: aString].
	
	currentString := aString.
	self matchesCase ifFalse: [currentString := aString asLowercase].
	
	self matchStrategy = #bitap ifTrue: [^ self intervalsForBitap: self term in: currentString].
	
	currentTerm := self term.
	self matchesWholeWord ifTrue: [currentTerm := ' {1} ' format: {currentTerm}].
	^ self tokensFor: currentTerm in: currentString select: [:token |
		self matchStrategy caseOf: {
			[#levenshtein] -> [self matchesLevenshtein: currentTerm in: token].
			[#nGram] -> [self matchesNGram: currentTerm in: token].
			[#soundex] -> [self matchesSoundex: currentTerm in: token]}]