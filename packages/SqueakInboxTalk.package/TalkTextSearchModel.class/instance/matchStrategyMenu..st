toolbuilder
matchStrategyMenu: menu

	| length |
	menu defaultTarget: self.
	
	self
		menu: menu add: 'exact matches' getState: #matchesExact setState: #matchesExact:;
		menu: menu add: 'wildcard matches' getState: #matchesWildcard setState: #matchesWildcard:;
		menu: menu add: 'fuzzy matches' getState: #matchesFuzzy setState: #matchesFuzzy:;
		menu: menu add: 'regex' getState: #matchesRegex setState: #matchesRegex:.
	
	menu addLine.
	length := menu items size.
	self menu: menu for: #specialMatchStrategyMenu.
	menu items size > length  ifFalse:
		[menu lastItem delete].
	
	^ menu