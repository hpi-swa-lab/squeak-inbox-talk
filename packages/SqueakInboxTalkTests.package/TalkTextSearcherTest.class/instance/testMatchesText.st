tests - matching
testMatchesText

	searcher newTerm: 'squeak'.
	
	self assert: (searcher matchesText: 'Viva la Squeak').
	self deny: (searcher matchesText: 'Viva la Pharo').
	self assert: (searcher matchesText: 'Squeak: good better squeak')