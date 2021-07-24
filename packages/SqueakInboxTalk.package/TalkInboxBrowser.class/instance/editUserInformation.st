actions
editUserInformation

	TalkPerson editCurrent ifNil: [^ self].
	
	self changed: #filters