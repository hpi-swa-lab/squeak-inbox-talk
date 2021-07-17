initialize-release
initializeInteractively

	self
		requestLines: 'What e-mail addresses do you use on the inbox?\Enter one per line.' withCRs
		initialAnswer: self mailAddresses
		ifAccepted: [:newAddresses | self mailAddresses: (OrderedCollection withAll: newAddresses)].
	
	self
		requestLines: 'What author initials do you use on the inbox?\Enter one per line.' withCRs
		initialAnswer: self allAuthorInitials
		ifAccepted: [:newInitials | self allAuthorInitials: (OrderedCollection withAll: newInitials)].
	
	self
		requestLines: 'Under which names are you mentioned in the inbox?\Enter one first name, nick name, or last name per line.' withCRs
		initialAnswer: self names
		ifAccepted: [:newNames | self names: (OrderedCollection withAll: newNames)]