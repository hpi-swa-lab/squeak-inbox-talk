toolbuilder
buildWith: aBuilder

	| windowSpec |
	windowSpec := self buildWindowWith: aBuilder specs: {
		(LayoutFrame
			fractions: (0 @ 0 corner: 1 / 3 @ 1)
			offsets: (0 @ 0 corner: 0 @ self buttonHeight negated)) -> [self buildMessageList: aBuilder].
		(LayoutFrame
			fractions: (0 @ 1 corner: 1 / 3 @ 1)
			offsets: (0 @ self buttonHeight negated corner: 0 @ 0)) -> [self buildReplyButton: aBuilder].
		(1 / 3 @ 0 corner: 1 @ 1) -> [self buildTextPane: aBuilder]}.
	^ aBuilder build: windowSpec