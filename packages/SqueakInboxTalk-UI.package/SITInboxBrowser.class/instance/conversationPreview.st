accessing - state
conversationPreview

	| conversation contributions |
	conversation := self selectedConversation ifNil: [^ nil].
	contributions := conversation contributions.
	
	contributions ifEmpty: [^ '{1}\\{2}' withCRs format: {conversation. conversation text}].
	
	contributions size = 1 ifTrue: [ | contribution |
		contribution := contributions anyOne.
		^ '{1}\State: {2}\\{3}' withCRs format: {conversation. contribution state. contribution summary}].
	
	^ '{1}\{2}\\Text:\\{3}' withCRs format: {
		conversation.
		contributions collect: [:contribution | '{1}: {2}' format: {contribution name. contribution state}].
		conversation text}