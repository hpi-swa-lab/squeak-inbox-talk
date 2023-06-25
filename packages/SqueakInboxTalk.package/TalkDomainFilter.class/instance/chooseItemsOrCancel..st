*SqueakInboxTalk-UI-menus
chooseItemsOrCancel: cancelBlock

	| allItems |
	allItems := Cursor wait showWhile: [self allItems].
	
	self flag: #todo.
	"initial selection - currently not supported by UIManager"
	^ (Project uiManager
		talkChooseMultipleFromLabeledValues: (allItems collect: [:item | (self labelForItem: item) -> item] as: Dictionary) withKeysSortedSafely
		title: self chooseLabel) ifNil: [^ cancelBlock value]