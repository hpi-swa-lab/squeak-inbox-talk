*SqueakInboxTalk-UI-squeak protocol
sitPrintOn: aStream

	self flag: #moveUpstream.
	
	self printYMDOn: aStream.
	aStream space.
	self printHMSOn: aStream