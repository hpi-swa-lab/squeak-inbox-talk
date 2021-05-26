tests
testConversationList
	"seconds"
	<timeout: 30>

	| browser |
	browser := self classUnderTest newDefault.
	self patch: browser inbox at: #downloadRange withValue: 10 days.
	"be fast"
	browser updateMessages.
	
	browser selectedConversationIndex: 1.
	
	self assert: browser selectedConversation notNil.
	self assert: (browser conversationPreview includesSubstring: browser selectedConversation subject)