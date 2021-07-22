tests
testEquality

	| firstMatches matcher secondMatches text |
	matcher := TalkTextSearcher new
		newTerm: 'wor';
		yourself.
	text := 'not enough words for this world'.
	
	firstMatches := (matcher matchesInText: text) contents.
	self assert: 2 equals: firstMatches size.
	self deny: firstMatches second equals: firstMatches first.
	self assert: firstMatches first equals: firstMatches first copy.
	
	secondMatches := (matcher matchesInText: text) contents.
	self assert: firstMatches equals: firstMatches