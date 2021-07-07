private-requests
requestLines: queryString initialAnswer: initialLines ifAccepted: acceptBlock

	| answer newLines |
	answer := (Project uiManager multiLineRequest: queryString initialAnswer: (initialLines joinSeparatedBy: String cr)) ifNil: [^ nil].
	
	newLines := ((answer lines collect: #withBlanksTrimmed) reject: #isEmpty) ifEmpty: [^ nil].
	^ acceptBlock value: newLines