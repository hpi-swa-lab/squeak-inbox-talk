accessing
conversations

	^ (SqhMailmanAggregator conversationsOn: {self name}) keys
		collect: [:wrapper | SITMailConversation on: wrapper]