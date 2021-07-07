toolbuilder
matchStrategyMenu: menu

	menu defaultTarget: self.
	
	self
		menu: menu add: 'exact matches' getState: #matchesExact setState: #matchesExact:;
		menu: menu add: 'fuzzy matches' getState: #matchesFuzzy setState: #matchesFuzzy:;
		menu: menu add: 'regex' getState: #matchesRegex setState: #matchesRegex:.
	
	^ menu