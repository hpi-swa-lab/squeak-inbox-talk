tests
testConversationList
	"seconds"
	<timeout: 30>

	| browser |
	browser := SITInboxBrowser newDefault.
	browser numberOfConversations: 500. "be fast"
	
	browser selectedConversationIndex: 1.
	
	self assert: browser selectedConversation notNil.
	self assert: (browser conversationPreview includesSubstring: browser selectedConversation subject)