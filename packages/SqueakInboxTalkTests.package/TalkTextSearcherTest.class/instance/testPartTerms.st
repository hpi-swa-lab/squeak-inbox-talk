tests - private
testPartTerms

	| term |
	term := 'foo "bar\\ \"baz\"" plong'.
	
	searcher hasComplexTerm: false.
	searcher newTerm: term.
	self assert: {term} equals: searcher partTerms.
	
	searcher hasComplexTerm: true.
	searcher newTerm: term.
	self assert: #('foo' 'bar\ "baz"' 'plong') equals: searcher partTerms