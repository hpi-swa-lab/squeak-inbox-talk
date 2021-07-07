printing
printOn: aStream

	super printOn: aStream.
	
	aStream
		nextPutAll: ' for ';
		print: self object.
	self label ifNotNil: [:labelString |
		aStream
			nextPutAll: ' at ';
			print: labelString].
	aStream
		space;
		print: self interval;
		nextPutAll: ': '.
	aStream print: self basicMatchText