accessing - text
similarConversationsText

	similarConversations ifNil: [
		self requestSimilarConversations.
		^ self similarConversationsText].
	
	similarConversations = #searching ifTrue: [
		^ '<i>Searching...</i>' asTextFromHtml].
	similarConversations isTalkBackgroundException ifTrue: [
		^ similarConversations messageText].
	
	self flag: #forLater. "This could be a multi-column list similar to the inbox browser..."
	similarConversations ifEmpty: [^ '(none found)'].
	
	self flag: #mid. "Use URLs to copyable message ids here once we support them"
	^ ((similarConversations collect: [:conversation |
		(conversation isTalkSemanticMessagesPlaceholder
			ifTrue:
				[conversation title asText
					addAttribute: TextEmphasis italic;
					yourself]
			ifFalse:
				[conversation subject asText])
					addAttribute: (PluggableTextAttribute evalBlock: [conversation browse]);
					yourself])
		fold: [:a :b | a , String cr , b])