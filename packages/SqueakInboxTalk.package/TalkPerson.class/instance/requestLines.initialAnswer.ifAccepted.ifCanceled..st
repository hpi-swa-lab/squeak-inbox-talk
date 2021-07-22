private-requests
requestLines: queryString initialAnswer: initialLines ifAccepted: acceptBlock ifCanceled: cancelBlock

	| answer newLines |
	answer := (Project uiManager
		multiLineRequest: queryString
		initialAnswer: (initialLines joinSeparatedBy: String cr)) ifNil: [^ cancelBlock value].
	
	newLines := ((answer lines collect: #withBlanksTrimmed) reject: #isEmpty) ifEmpty: [^ nil].
	^ acceptBlock value: newLines