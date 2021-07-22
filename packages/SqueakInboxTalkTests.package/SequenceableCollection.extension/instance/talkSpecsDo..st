*SqueakInboxTalkTests-enumerating
talkSpecsDo: aBlock

	self do: [:each | aBlock valueWithArguments: each]