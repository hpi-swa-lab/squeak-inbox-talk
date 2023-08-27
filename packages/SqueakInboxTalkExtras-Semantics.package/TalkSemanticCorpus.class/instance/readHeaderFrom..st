fileIn/Out
readHeaderFrom: aStream

	| inboxName |
	aStream ascii.
	inboxName := aStream upTo: Character cr..
	inbox := TalkInbox on: (TalkMailingList named: inboxName).