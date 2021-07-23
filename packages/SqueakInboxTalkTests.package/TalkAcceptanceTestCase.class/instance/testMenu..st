asserting
testMenu: aSymbol

	| protoMenu menu |
	protoMenu := self mockMenu.
	self
		patch: browser
		at: #offerMenu:
		with: [:this :someBlock | menu := someBlock value: protoMenu copy]
		during: [
			(browser perform: aSymbol withEnoughArguments: {protoMenu}) in: [:result | menu ifNil: [menu := result]].
			aSymbol = #addModelItemsToWindowMenu: ifTrue: [menu := protoMenu].
			self shouldntFail: [menu imageForm].
			self deny: menu items isEmpty]