constants
resources

	| resources |
	resources := Dictionary new.
	self packageInfo methods do: [:method |
		method compiledMethod pragmas do: [:pragma |
			(pragma keyword findFeatures at: 1 ifAbsent: []) = #resource ifTrue: [ | key |
				key := Message selector: pragma keyword arguments: pragma arguments.
				(resources at: key ifAbsentPut: [Set new]) add: method]]].
	^ resources