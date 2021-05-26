*SqueakInboxTalk-Core-converting
talkWithoutLeading: prefix

	^ (self beginsWith: prefix)
		ifTrue: [self allButFirst: prefix size]
		ifFalse: [self]