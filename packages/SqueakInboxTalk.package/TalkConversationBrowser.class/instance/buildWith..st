toolbuilder
buildWith: aBuilder

	| windowSpec |
	windowSpec := self buildWindowWith: aBuilder specs: {
		(LayoutFrame new
			rightFraction: 1;
			bottomOffset: self buttonHeight;
			yourself) -> [self buildFilterBar: aBuilder].
		(LayoutFrame new
			topOffset: self buttonHeight;
			rightFraction: 1;
			bottomFraction: 1;
			yourself) -> [self buildContentPane: aBuilder]}.
	^ aBuilder build: windowSpec