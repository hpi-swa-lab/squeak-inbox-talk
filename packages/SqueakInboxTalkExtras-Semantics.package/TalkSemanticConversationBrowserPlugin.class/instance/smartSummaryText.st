accessing - text
smartSummaryText

	smartSummary ifNil: [
		self requestSmartSummary.
		^ self smartSummaryText].
	
	smartSummary = #generating ifTrue: [
		^ '<i>Generating...</i>' asTextFromHtml].
	smartSummary isTalkBackgroundException ifTrue: [
		^ smartSummary messageText].
	
	^ '{1} {2}<br><i>{3}</i>' asTextFromHtml format:
		{('[{1} Chat]' asText format: {self smartChatIcon talkAsText})
			addAttribute: (PluggableTextAttribute evalBlock: [smartSummaryConversation open]);
			yourself.
		(smartSummary isText not and: [smartSummary isStreaming] and: [smartSummary isComplete not])
			ifTrue:
				[('[{1} Cancel]' asText format: {self smartCancelIcon talkAsText})
					addAttribute: (PluggableTextAttribute evalBlock: [self cancelSmartSummary]);
					yourself]
			ifFalse:
				[('[{1} Regenerate]' asText format: {self smartRerequestIcon talkAsText})
					addAttribute: (PluggableTextAttribute evalBlock: [self rerequestSmartSummary]);
					yourself].
		smartSummary isText
			ifTrue: [smartSummary]
			ifFalse: [smartSummary content]}