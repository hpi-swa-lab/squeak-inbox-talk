tests
testBuildFor: aConversation
	"Mostly a smoke test."

	browser := self classUnderTest on: aConversation.
	
	self testWindowFor: browser.
	
	"Menus"
	self testMenu: #messageMenu:.
	"without selection"
	browser selectMessage: browser messages first.
	self testMenu: #messageMenu:.
	"with selection"
	""
	"Message list"
	self testTableColumns: browser messageColumns elementWithIndicesDo: [:element :rowIndex :columnIndex |
		self assert: element isString.
		self assert: element notEmpty].
	
	"Text panes"
	browser messages do: [:message | | headerText |
		browser selectMessage: message.
		self assert: browser currentText notEmpty.
		headerText := browser headerText.
		self
			assert: headerText isText;
			assert: 3 equals: headerText asString lines size].
	browser selectMessage: nil.
	self shouldntFail: [
		browser
			currentText;
			headerText]