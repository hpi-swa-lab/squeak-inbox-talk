tests
testConversationList
	"seconds"
	<timeout: 30>

	| browser |
	browser := SITInboxBrowser newDefault.
	browser fetchMoreConversations.
	browser selectedConversationIndex: 1.
	self assert: browser selectedConversation notNil.
	self assert: (browser conversationPreview includesSubstring: browser selectedConversation subject)