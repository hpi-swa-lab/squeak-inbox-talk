toolbuilder
buildWith: aBuilder

	| windowSpec |
	windowSpec := self buildWindowWith: aBuilder specs: {
		(0 @ 0 corner: 1 / 3 @ 1) -> [self buildMessageList: aBuilder].
		(1 / 3 @ 0 corner: 1 @ 1) -> [self buildTextPane: aBuilder]}.
	^ aBuilder build: windowSpec