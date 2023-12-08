fileIn/Out
readHeaderFrom: aStream

	| inboxName |
	super readHeaderFrom: aStream.
	
	aStream ascii.
	inboxName := aStream upTo: Character cr..
	inbox := TalkInbox on: (TalkMailingList named: inboxName).