fileIn/out
readObjectFrom: aStream for: aCorpus

	| messageId |
	aStream ascii.
	messageId := aStream upTo: Character cr.
	object := aCorpus inbox messageForId: messageId.