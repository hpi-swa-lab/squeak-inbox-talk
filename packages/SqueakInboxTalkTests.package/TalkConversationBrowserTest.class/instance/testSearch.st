tests
testSearch

	| selectedText |
	browser searchModel
		searchTerm: '"text 2"';
		accept: '"text 2"'.
	
	self deny: browser searchModel hasSearchError.
	self assert: self mockMessage2 equals: browser selectedMessage.
	selectedText := browser currentText
		copyFrom: browser textSelection start
		to: browser textSelection stop.
	self
		assert: 'text 2' equals: selectedText asString;
		assert: selectedText talkIsAllEmphasized