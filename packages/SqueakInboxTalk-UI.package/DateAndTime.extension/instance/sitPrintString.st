*SqueakInboxTalk-UI-squeak protocol
sitPrintString

	self flag: #moveUpstream.
	
	^ String streamContents: [:stream | self sitPrintOn: stream]