fileIn/out
writeObjectOn: aStream

	aStream ascii.
	aStream nextPutAll: self message messageId; cr.