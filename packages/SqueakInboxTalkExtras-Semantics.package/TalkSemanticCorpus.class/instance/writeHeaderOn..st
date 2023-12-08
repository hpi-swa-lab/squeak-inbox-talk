fileIn/Out
writeHeaderOn: aStream

	super writeHeaderOn: aStream.
	
	aStream ascii.
	aStream nextPutAll: self inbox name; cr.