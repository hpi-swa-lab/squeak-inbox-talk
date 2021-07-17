tests
testFilterInvolvement

	| person |
	self wrapTest: [:block | | previousPerson |
		previousPerson := TalkPerson current.
		block ensure: [TalkPerson current: previousPerson]].
	TalkPerson current: nil.
	
	person := TalkPerson christoph.
	[self toggleFilter: 'conversations by myself' to: true] valueSupplyingAnswers: {
		{'*mail addresses*inbox*'. person mailAddresses joinSeparatedBy: Character cr}.
		{'*author initials*inbox*'. person allAuthorInitials joinSeparatedBy: Character cr}.
		{'*names*inbox*'. person names joinSeparatedBy: Character cr}}.
	self waitWhileBusy.
	
	self shouldBeFiltered: [:conversation | conversation includesAuthor: person]