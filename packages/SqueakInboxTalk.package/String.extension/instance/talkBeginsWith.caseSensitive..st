*SqueakInboxTalk-Core-testing
talkBeginsWith: aString caseSensitive: caseSensitive

	^ (self findString: aString startingAt: 1 caseSensitive: caseSensitive) = 1