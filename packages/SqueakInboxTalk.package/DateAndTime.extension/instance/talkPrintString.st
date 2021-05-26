*SqueakInboxTalk-UI-squeak protocol
talkPrintString

	self flag: #moveUpstream.
	
	^ String streamContents: [:stream | self talkPrintOn: stream]