private
annotateSearchTermWith: anError

	| position |
	(searchError respondsTo: #position) ifFalse: [^ self].
	position := searchError position ifNil: [^ self].
	searchTermDraft := self searchTerm asText
		addAllAttributes: {TextEmphasis bold. TextColor color: self errorTextColor}
		from: position
		to: position.