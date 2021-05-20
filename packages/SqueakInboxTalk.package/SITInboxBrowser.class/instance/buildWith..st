toolbuilder
buildWith: aBuilder

	| windowSpec |
	windowSpec := self buildWindowWith: aBuilder specs: {
		(LayoutFrame fractions: (0 @ 0 corner: 1 @ 0) offsets: (0 @ 0 corner: 0 @ self buttonHeight)) -> [self buildButtonBar: aBuilder].
		(LayoutFrame
			fractions: (0 @ 0 corner: 1 @ (1 / 2))
			offsets: (0 @ self buttonHeight corner: 1 @ 0)) -> [self buildConversationsList: aBuilder].
		(LayoutFrame fractions: (0 @ 1 / 2 corner: 1 @ 1)) -> [self buildConversationPreview: aBuilder]}.
	^ aBuilder build: windowSpec