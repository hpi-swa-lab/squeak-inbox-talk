accessing
allInvolvements

	^ Dictionary new
		at: ((self person
				ifNil: [#()]
				ifNotNil: [:currentPerson | currentPerson allAuthorInitials ifNotEmpty: #anyOne])
				ifEmpty: ['conversations by myself']
				ifNotEmpty: [:initials | 'conversations by myself ({1})' format: {initials}])
			put: #author;
		at: 'conversations in which I have engaged' put: #participated;
		at: 'conversations in which I received replies' put: #newReplies;
		at: 'conversations in which I was mentioned' put: #mentioned;
		yourself