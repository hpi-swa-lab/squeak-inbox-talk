accessing
mails

	^ SqhMailmanAggregator
		messagesOn: {self name}
		collect: [:wrapper | SITMailObject on: wrapper]