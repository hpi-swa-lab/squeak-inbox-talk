tests - smoke
testBuild
	"Mostly a smoke test."

	self wrapTest: [:block | | previousPerson |
		previousPerson := TalkPerson currentOrNil.
		block ensure: [TalkPerson current: previousPerson]].
	TalkPerson current: TalkPerson christoph.
	
	self testWindowFor: browser.
	"Menus"
	
	self testMenus: #(#offerAppMenu #addModelItemsToWindowMenu: #offerContributeMenu #offerFilterMenu).
	"without selection"
	browser selectConversation: browser conversations first.
	self testMenus: #(#conversationMenu: #offerFilterMenu).
	"with selection"
	""
	"Conversation list"
	self testTableColumns: browser conversationColumns elementWithIndicesDo: [:element :rowIndex :columnIndex |
		(#(#contributionState #involvementState) includes: (browser columnNameAt: columnIndex)) ifFalse: [
			self assert: element isString.
			self assert: element notEmpty].
		"Icons"
		self assert: [ | icon |
			icon := browser conversationIconAtRow: rowIndex atColumn: columnIndex.
			icon isNil or: [icon isForm and: [icon extent area strictlyPositive]]].
		"Balloon texts"
		self assert: [ | help |
			help := browser conversationHelpAtRow: rowIndex atColumn: columnIndex.
			help isNil or: [help isString] or: [help isText]]].
	
	"Contents pane"
	browser conversations do: [:conversation | | contents |
		browser selectConversation: conversation.
		self waitWhileBusy.
		contents := browser contents.
		self assert: contents notEmpty]