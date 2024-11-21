printing
printOn: aStream

	aStream withAttribute: TextEmphasis italic do:
		[aStream nextPutAll: self messageId].