actions
setUserInformation

	TalkPerson currentOrNil
		ifNil: [TalkPerson current]
		ifNotNil: [:person | person initializeInteractively].
	
	self changed: #filters