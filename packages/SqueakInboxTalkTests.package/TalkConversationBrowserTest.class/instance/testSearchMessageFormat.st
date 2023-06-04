tests - searching
testSearchMessageFormat

	browser searchModel
		searchTerm: 'text(\*| 2)';
		matchesRegex: true;
		accept: 'text(\*| 2)'.
	
	self assert: self mockMessage2 equals: browser selectedMessage.
	self assert: 'text 2' equals: self selectedBrowserText asString.
	
	browser messageFormat: #plainText.
	self assert: self selectedBrowserText isEmpty.
	browser searchModel accept: 'text(\*| 2)'.
	self assert: self mockMessage1 equals: browser selectedMessage.
	self assert: 'text*' equals: self selectedBrowserText asString.
	
	browser messageFormat: #richText.
	self assert: self selectedBrowserText isEmpty.
	browser searchModel accept: 'text(\*| 2)'.
	self assert: self mockMessage2 equals: browser selectedMessage.
	self assert: 'text 2' equals: self selectedBrowserText asString.