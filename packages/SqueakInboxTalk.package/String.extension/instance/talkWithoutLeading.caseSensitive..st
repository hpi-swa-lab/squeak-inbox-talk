*SqueakInboxTalk-Core-converting
talkWithoutLeading: prefix caseSensitive: caseSensitive

	^ (self talkBeginsWith: prefix caseSensitive: caseSensitive)
		ifTrue: [self allButFirst: prefix size]
		ifFalse: [self]