*SqueakInboxTalk-UI-squeak protocol
talkPrintOn: aStream

	self flag: #moveUpstream.
	
	self offset = self class localOffset ifFalse: [^ self asLocal talkPrintOn: aStream].
	
	self printYMDOn: aStream.
	aStream space.
	self printHMSOn: aStream