fileIn/Out
importFromFileNamed: aString

	| corpus |
	corpus := self fromFileNamed: aString.
	self corpora at: corpus inbox put: corpus.
	^ corpus