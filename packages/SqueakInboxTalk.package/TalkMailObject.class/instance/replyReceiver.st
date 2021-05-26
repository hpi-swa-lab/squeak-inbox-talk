accessing
replyReceiver

	self flag: #moveUpstream.
	"Move to SqueakHistory?"
	^ SqhMailmanAggregator new
		talkNormalizeMailAddress: self mailMessage replyReceiver
		withAddressAndInitialsDo: [:address :initials | address]