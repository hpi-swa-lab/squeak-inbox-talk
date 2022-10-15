toolbuilder
buildWith: aBuilder

	| y windowSpec |
	y := 0.
	windowSpec := self buildWindowWith: aBuilder specs: {
		(LayoutFrame new
			rightFraction: 1;
			bottomOffset: (y := y + self buttonHeight);
			yourself) -> [self buildButtonBar: aBuilder].
		(LayoutFrame new
			rightFraction: 1;
			topOffset: (y := y + 2 px);
			bottomOffset: (y := y + self buttonHeight);
			yourself) -> [self buildFilterBar: aBuilder].
		(LayoutFrame new
			rightFraction: 1;
			bottomFraction: 1 / 2;
			topOffset: y;
			yourself) -> [self buildConversationsList: aBuilder].
		(LayoutFrame new
			topFraction: 1 / 2;
			rightFraction: 1;
			bottomFraction: 1;
			yourself) -> [self buildTextPane: aBuilder]}.
	^ aBuilder build: windowSpec