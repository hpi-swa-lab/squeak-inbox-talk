tests
testSearchAndNavigate

	browser searchModel searchTerm: 'hi'.
	self waitWhileBusy.
	
	self deny: browser searchModel hasSearchError.
	self shouldBeFiltered.
	
	"forward"
	self assert: browser selectedConversation isNil.
	browser conversations do: [:conversation |
		browser searchModel accept: browser searchModel searchTerm.
		self waitWhileBusy.
		
		self deny: browser searchModel hasSearchError.
		self shouldBeFiltered.
		self assert: conversation equals: browser selectedConversation].
	browser searchModel accept: browser searchModel searchTerm.
	self waitWhileBusy.
	self deny: browser searchModel hasSearchError.
	self shouldBeFiltered.
	self assert: browser conversations first equals: browser selectedConversation.
	"reset selection"
	browser selectConversation: nil.
	"backward"
	self patch: browser searchModel at: #currentEventShiftPressed withValue: true during: [
		self assert: browser selectedConversation isNil.
		browser conversations reversed do: [:conversation |
			browser searchModel accept: browser searchModel searchTerm.
			self waitWhileBusy.
			
			self deny: browser searchModel hasSearchError.
			self shouldBeFiltered.
			self assert: conversation equals: browser selectedConversation].
		browser searchModel accept: browser searchModel searchTerm.
		self waitWhileBusy.
		self deny: browser searchModel hasSearchError.
		self shouldBeFiltered.
		self assert: browser conversations last equals: browser selectedConversation]