printing
printOn: aStream

	aStream nextPutAll: ('<1p> named: <2p>' expandMacrosWithArguments: {self class. self name})