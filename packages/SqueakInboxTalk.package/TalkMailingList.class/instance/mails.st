accessing
mails

	^ SqhMailmanAggregator
		messagesOn: {self name}
		collect: [:wrapper | TalkMailObject on: wrapper]