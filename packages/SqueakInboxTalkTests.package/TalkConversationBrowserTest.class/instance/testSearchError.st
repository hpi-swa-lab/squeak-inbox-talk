tests
testSearchError

	| debugAttribute debugPosition |
	browser searchModel searchTerm: '"text 2'.
	
	browser currentText.
	self assert: browser searchModel hasSearchError.
	self assert: (browser currentText asString includesSubstring: 'invalid search query').
	
	debugPosition := browser currentText findString: 'click to debug' startingAt: 1.
	self assert: debugPosition > 0.
	debugAttribute := (browser currentText attributesAt: debugPosition) detect: #mayActOnClick.
	self should: [debugAttribute actOnClickFor: nil] raise: Error.
	
	browser searchModel searchTerm: '"text 2"'.
	
	self deny: browser searchModel hasSearchError.
	self assert: browser selectedMessage text asString equals: browser currentText asString