printing
printOn: aStream

	super printOn: aStream.
	aStream
		space;
		nextPut: $(;
		nextPutAll: (self basicSubject printStringLimitedTo: 80);
		nextPut: $)