toolbuilder
buildWith: aBuilder

	| windowSpec |
	windowSpec := self buildWindowWith: aBuilder specs: {
		(LayoutFrame new
			rightFraction: 1;
			bottomOffset: self buttonHeight;
			yourself) -> [self buildButtonBar: aBuilder].
		(LayoutFrame new
			rightFraction: 1;
			topOffset: self buttonHeight;
			bottomOffset: self buttonHeight * 2;
			yourself) -> [self buildFilterBar: aBuilder].
		(LayoutFrame new
			rightFraction: 1;
			bottomFraction: 1 / 2;
			topOffset: self buttonHeight * 2;
			yourself) -> [self buildConversationsList: aBuilder].
		(LayoutFrame new
			topFraction: 1 / 2;
			rightFraction: 1;
			bottomFraction: 1;
			yourself) -> [self buildTextPane: aBuilder]}.
	^ aBuilder build: windowSpec