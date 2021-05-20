printing
printOn: aStream

	super printOn: aStream.
	aStream
		space;
		nextPut: $(;
		nextPutAll: (self subject printStringLimitedTo: 80);
		nextPut: $)