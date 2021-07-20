accessing - toolbuilder
conversationHelpAtRow: rowIndex atColumn: columnIndex

	| conversation |
	conversation := self conversations at: rowIndex ifAbsent: [^ nil].
	conversation = #searching ifTrue: [^ nil].
	
	^ self conversationHelpFor: conversation atColumnNamed: (self columnNameAt: columnIndex)