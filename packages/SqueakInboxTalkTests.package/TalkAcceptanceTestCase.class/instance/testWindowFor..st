asserting
testWindowFor: model

	| menu window |
	window := self shouldntFail: [ToolBuilder build: model].
	
	menu := window buildWindowMenu.
	self
		shouldntFail: [window imageForm];
		shouldntFail: [menu imageForm].
	
	self shouldntFail: [window activate]