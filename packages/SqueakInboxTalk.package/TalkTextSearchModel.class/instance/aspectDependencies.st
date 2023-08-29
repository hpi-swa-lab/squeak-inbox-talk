updating
aspectDependencies

	^ super aspectDependencies
		at: #color put: #(#hasSearchError);
		at: #matchStrategyAbbreviation put: #(#searchStrategy);
		at: #matchStrategyLabel put: #(#searchStrategy);
		at: #search put: #(#matchesCase #matchesWholeWord #searchStrategy);
		at: #searchStrategy
			put: #(#matchesExact #matchesWildcard #matchesFuzzy #matchesRegex);
		yourself