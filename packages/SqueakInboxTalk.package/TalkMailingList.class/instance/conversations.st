accessing
conversations

	^ (SqhMailmanAggregator conversationsOn: {self name}) keys
		collect: [:wrapper | TalkMailConversation on: wrapper]