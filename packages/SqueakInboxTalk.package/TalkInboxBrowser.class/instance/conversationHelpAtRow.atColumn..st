accessing - toolbuilder
conversationHelpAtRow: rowIndex atColumn: columnIndex

	| conversation |
	conversation := self conversations at: rowIndex ifAbsent: [^ nil].
	conversation = #searching ifTrue: [^ nil].
	
	columnIndex = 3 ifTrue: [TalkPerson hasCurrent ifTrue: [^ self helpForInvolvementState: conversation]].
	
	Preferences balloonHelpInMessageLists ifFalse: [^ nil].
	^ conversation messages first text truncateWithElipsisTo: 200