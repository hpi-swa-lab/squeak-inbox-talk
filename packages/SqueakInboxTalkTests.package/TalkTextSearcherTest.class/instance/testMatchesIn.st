tests - matching
testMatchesIn

	| matches object |
	searcher newTerm: 'squeak'.
	object := Object new.
	
	matches := (searcher
		matchesInText: 'CARPE SQUEAK! Squeak is fun!'
		from: object
		label: 'lbl'
		isLabelSearchable: false) contents.
	
	self assert: 2 equals: matches size.
	self
		assert: #('lbl: SQUEAK' 'lbl: Squeak')
			equals: (matches collect: [:match | match matchText asString]);
		assert: {object} equals: (matches collect: [:match | match object]) withoutDuplicates;
		assert: {'lbl'} equals: (matches collect: [:match | match key]) withoutDuplicates;
		assert: #('SQUEAK' 'Squeak')
			equals: (matches collect: [:match | match contents copyFrom: match start to: match stop])