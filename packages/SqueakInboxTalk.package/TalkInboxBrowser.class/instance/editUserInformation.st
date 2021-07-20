actions
editUserInformation

	(TalkPerson currentOrNil
		ifNil: [
			TalkPerson
				current;
				currentOrNil]
		ifNotNil: [:person | person initializeInteractively]) ifNil: [^ self].
	
	self changed: #filters