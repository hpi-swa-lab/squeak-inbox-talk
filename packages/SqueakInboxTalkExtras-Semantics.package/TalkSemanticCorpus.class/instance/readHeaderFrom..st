fileIn/Out
readHeaderFrom: aStream

	| inboxName |
	aStream ascii.
	inboxName := aStream upTo: Character cr..
	self initializeForInbox: (TalkInbox on: (TalkMailingList named: inboxName)).