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
			rightFraction: 1 / 3;
			bottomFraction: 1;
			bottomOffset: self buttonHeight negated;
			yourself) -> [self buildMessageList: aBuilder].
		(LayoutFrame new
			topFraction: 1 offset: self buttonHeight negated;
			rightFraction: 1 / 3;
			bottomFraction: 1;
			yourself) -> [self buildReplyButton: aBuilder].
		(LayoutFrame new
			topOffset: self buttonHeight;
			leftFraction: 1 / 3;
			rightFraction: 1;
			bottomFraction: 1;
			yourself) -> [self buildTextPane: aBuilder]}.
	^ aBuilder build: windowSpec