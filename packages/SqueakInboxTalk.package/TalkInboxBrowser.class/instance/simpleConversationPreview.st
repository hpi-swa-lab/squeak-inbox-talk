accessing - state
simpleConversationPreview
	"Lightweight alternative to #conversationPreview that is shown until the full preview text has been loaded."

	| conversation contributions |
	conversation := self selectedConversation ifNil: [^ nil].
	contributions := conversation contributions.
	
	contributions ifEmpty: [^ '{1}\\{2}' withCRs format: {conversation. conversation text}].
	
	^ '{1}<br>State: <i>Loading...</i>' withCRs asTextFromHtml format: {conversation}