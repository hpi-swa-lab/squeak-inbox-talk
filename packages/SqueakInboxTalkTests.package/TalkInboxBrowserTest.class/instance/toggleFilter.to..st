support
toggleFilter: matchString to: aBoolean

	| filter |
	filter := self findFilterItem: matchString.
	filter talkBinaryState = aBoolean ifFalse: [filter doButtonAction].
	self assert: aBoolean equals: filter talkBinaryState