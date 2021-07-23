tests
testSearch

	browser searchModel searchTerm: 'hi'.
	self waitWhileBusy.
	
	self deny: browser searchModel hasSearchError.
	self shouldBeFiltered.
	browser conversations do: [:conversation | | position |
		browser selectConversation: conversation.
		self waitWhileBusy.
		position := browser contents findString: 'hi' startingAt: 1 caseSensitive: false.
		self deny: position isZero.
		self assert: (browser contents copyFrom: position to: position + 'hi' size - 1) talkIsAllEmphasized]