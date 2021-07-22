tests - matching
testMatches

	searcher newTerm: 'squeak'.
	
	self assert: (searcher matches: 'Viva la Squeak').
	self deny: (searcher matches: 'Viva la Pharo').
	self assert: (searcher matches: 'Squeak: good better squeak')