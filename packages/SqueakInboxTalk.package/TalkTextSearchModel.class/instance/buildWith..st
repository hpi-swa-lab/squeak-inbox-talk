toolbuilder
buildWith: aBuilder

	^ aBuilder pluggablePanelSpec new
		layout: #horizontal;
		children: (OrderedCollection new
			add: (self buildTextBox: aBuilder);
			add: ((self buildToggle: aBuilder)
				label: 'Aa';
				help: 'match case';
				state: #matchesCase;
				action: #toggleMatchesCase;
				yourself);
			add: ((self buildToggle: aBuilder)
				label: '|_|';
				help: 'match whole word';
				state: #matchesWholeWord;
				action: #toggleMatchesWholeWord;
				yourself);
			add: ((self buildToggle: aBuilder)
				label: #matchStrategyAbbreviation;
				help: #matchStrategyHelp;
				action: #offerMatchStrategyMenu;
				yourself);
			yourself);
		yourself