tests - private
testIntervalsForWildcard

	| string |
	string := 'abcdeabcde'.
	#(('a' ((1 1) (6 1)))
	('e' ((5 1) (10 1)))
	('ab' ((1 2) (6 2)))
	('de' ((4 2) (9 2)))
	('dea' ((4 3)))
	('bd' ())
	('b#d' ((2 3) (7 3)))
	('c#e#b' ((3 5)))
	('c#e#a' ())
	('#' ((1 1) (2 1) (3 1) (4 1) (5 1) (6 1) (7 1) (8 1) (9 1) (10 1)))
	('#c#' ((2 3) (7 3)))
	('c##' ((3 3) (8 3)))
	('##c' ((1 3) (6 3)))
	('b*c' ((2 2) (7 2)))
	('b*d' ((2 3) (7 3)))
	('b*e' ((2 4) (7 4)))
	('b*d*b' ((2 6)))
	('e*d*d' ())
	"('*' ())"
	('*a' ((1 1) (6 1)))
	('e*' ((5 1) (10 1)))
	('*c*' ((3 1) (8 1)))
	('**c**' ((3 1) (8 1))))
		talkSpecsDo: [:pattern :expected |
			| expectedIntervals intervals |
			expectedIntervals := expected collect: [:pair | pair first to: pair first + pair second - 1].
			intervals := (searcher intervalsForWildcard: pattern in: string) contents.
			self assert: expectedIntervals equals: intervals.
			
			"does the behavior align with String>>#match:?"
			self assert: (('*{1}*' format: {pattern}) match: string) equals: intervals notEmpty].
	
	searcher matchesWholeWord: true.
	self assert: (searcher intervalsForWildcard: 'a' in: string) contents isEmpty.
	self assert: {1 to: 10} equals: (searcher intervalsForWildcard: 'a*' in: string) contents.
	self assert: (searcher intervalsForWildcard: 'e' in: string) contents isEmpty.
	self assert: {1 to: 10} equals: (searcher intervalsForWildcard: '*e' in: string) contents.
	self assert: {1 to: 10} equals: (searcher intervalsForWildcard: 'a#c#e#b#d#' in: string) contents.
	self assert: {1 to: 10} equals: (searcher intervalsForWildcard: 'a*e' in: string) contents.