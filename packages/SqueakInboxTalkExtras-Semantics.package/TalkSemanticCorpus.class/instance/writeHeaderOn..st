fileIn/Out
writeHeaderOn: aStream

	aStream ascii.
	aStream nextPutAll: self inbox name; cr.