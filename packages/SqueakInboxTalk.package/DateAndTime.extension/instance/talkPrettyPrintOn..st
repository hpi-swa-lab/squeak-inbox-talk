*SqueakInboxTalk-UI-squeak protocol
talkPrettyPrintOn: aStream

	self flag: #moveUpstream.
	
	self offset = self class localOffset ifFalse: [^ self asLocal talkPrettyPrintOn: aStream].
	
	self printYMDOn: aStream.
	aStream space.
	self printHMSOn: aStream