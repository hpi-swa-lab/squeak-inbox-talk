tests
testBuild
	"Mostly a smoke test."

	| menu window |
	window := self shouldntFail: [ToolBuilder build: browser].
	menu := window buildWindowMenu.
	self
		shouldntFail: [window imageForm];
		shouldntFail: [menu imageForm].
	
	"Menus"
	self
		patch: browser
		at: #offerMenu:
		with: [:this :someBlock | self shouldntFail: [(someBlock value: menu copy) imageForm]].
	self shouldntFail: [browser offerAppMenu].
	self shouldntFail: [browser addModelItemsToWindowMenu: menu].
	self shouldntFail: [
		browser offerFilterMenu
		"without selection"].
	browser selectConversation: browser conversations first.
	self shouldntFail: [browser conversationMenu: menu].
	self shouldntFail: [
		browser offerFilterMenu
		"with selection"].
	
	"Conversation list"
	browser conversationColumns withIndexDo: [:column :columnIndex |
		1 to: browser conversations size do: [:rowIndex |
			(#(#contributionState #involvementState) includes: (browser columnNameAt: columnIndex)) ifFalse: [ | element |
				element := column at: rowIndex.
				self assert: element isString.
				self assert: element notEmpty].
			"Icons"
			self assert: [ | icon |
				icon := browser conversationIconAtRow: rowIndex atColumn: columnIndex.
				icon isNil or: [icon isForm and: [icon extent area strictlyPositive]]].
			"Balloon texts"
			self assert: [ | help |
				help := browser conversationHelpAtRow: rowIndex atColumn: columnIndex.
				help isNil or: [help isString] or: [help isText]]]]