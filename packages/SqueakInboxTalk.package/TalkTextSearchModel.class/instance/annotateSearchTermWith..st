private
annotateSearchTermWith: anError

	| position |
	(anError respondsTo: #position) ifFalse: [^ self].
	position := anError position ifNil: [^ self].
	self assert: (position between: 1 and: self searchTerm size).
	searchTermDraft := self searchTerm asText
		addAllAttributes: {TextEmphasis bold. TextColor color: self errorTextColor}
		from: position
		to: position