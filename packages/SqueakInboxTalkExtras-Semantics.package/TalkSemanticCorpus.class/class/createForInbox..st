accessing
createForInbox: anInbox

	| corpus |
	corpus := self newForInbox: anInbox.
	self corpora at: anInbox put: corpus.
	^ corpus updateFromInbox