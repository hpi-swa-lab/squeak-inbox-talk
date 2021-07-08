matching - private
basicMatchesIn: aString
	"Yield an interval for every occurence of the current search term in aString."
	"Comparative observations:
	- BITAP - 7 sec, does not detect added/removed chars - 'proces-faitfhul debugging' not found
	- LEVENSHTEIN - 54 sec
	- NGRAMS - 51 sec
	- SOUNDEX - 13 sec, way too imprecise - 'process' sounds like 'project', 'baloon' like 'boolean'"

	| currentString currentTerm |
	self isActive ifFalse: [^ Generator on: [:gen | gen nextPut: (1 to: aString size)]].
	
	self usesRegex ifTrue: [^ self regexMatchesIn: aString].
	
	self matchStrategy ifNil: [^ self matchesForExact: term in: aString].
	
	currentString := aString.
	currentTerm := self term.
	self matchesCase ifFalse: [currentString := aString asLowercase].
	self matchesWholeWord ifTrue: [currentTerm := ' {1} ' format: {currentTerm}].
	
	self matchStrategy = #bitap ifTrue: [^ self matchesForBitap: currentTerm in: currentString].
	
	^ self tokensFor: currentTerm in: currentString select: [:token |
		self matchStrategy caseOf: {
			[#levenshtein] -> [self matchesLevenshtein: currentTerm in: token].
			[#nGram] -> [self matchesNGram: currentTerm in: token].
			[#soundex] -> [self matchesSoundex: currentTerm in: token]}]