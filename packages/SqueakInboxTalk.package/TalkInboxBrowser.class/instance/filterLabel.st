accessing - toolbuilder
filterLabel

	| filterCount |
	filterCount := self menuFilter enabledOptionsCount.
	^ filterCount > 0
		ifTrue: ['Filter ({1})' format: {filterCount}]
		ifFalse: ['Filter']
