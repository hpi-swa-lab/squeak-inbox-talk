fileIn/Out
importFromFileNamed: aString

	| corpus |
	corpus := self fromFileNamed: aString.
	corpus initializeForInbox: corpus inbox.
	self corpora at: corpus inbox put: corpus.
	^ corpus