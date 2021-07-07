printing
printOn: aStream

	super printOn: aStream.
	aStream
		space;
		nextPut: $(;
		nextPutAll: (self simpleSubject printStringLimitedTo: 80);
		nextPut: $)