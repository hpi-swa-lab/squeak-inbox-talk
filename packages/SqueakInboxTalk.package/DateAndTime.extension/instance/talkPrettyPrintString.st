*SqueakInboxTalk-UI-squeak protocol
talkPrettyPrintString

	self flag: #moveUpstream.
	
	^ String streamContents: [:stream | self talkPrettyPrintOn: stream]