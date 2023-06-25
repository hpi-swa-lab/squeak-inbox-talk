*SqueakInboxTalk-UI-menus
chooseItemsOrCancel: cancelBlock

	self flag: #todo.
	"initial selection - currently not supported by UIManager"
	^ (Project uiManager
		talkChooseMultipleFromLabeledValues: (self allItems collect: [:item | (self labelForItem: item) -> item] as: Dictionary) withKeysSortedSafely
		title: self chooseLabel) ifNil: [^ cancelBlock value]