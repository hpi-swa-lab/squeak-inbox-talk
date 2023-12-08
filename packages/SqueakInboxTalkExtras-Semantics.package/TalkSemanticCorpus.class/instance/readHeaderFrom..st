fileIn/Out
readHeaderFrom: aStream

	| inboxName |
	super readHeaderFrom: aStream.
	
	aStream ascii.
	inboxName := aStream upTo: Character cr..
	self initializeForInbox: (TalkInbox on: (TalkMailingList named: inboxName)).