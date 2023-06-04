tests - searching
testSearch

	browser searchModel
		searchTerm: '"text 2"';
		accept: '"text 2"'.
	
	self deny: browser searchModel hasSearchError.
	self assert: self mockMessage2 equals: browser selectedMessage.
	self
		assert: 'text 2' equals: self selectedBrowserText asString;
		assert: self selectedBrowserText talkIsAllEmphasized.