accessing
allInvolvements

	^ Dictionary new
		at: ((self person ifNil: [#()] ifNotNil: [:currentPerson | currentPerson allAuthorInitials ifEmpty: [] ifNotEmpty: #anyOne])
				ifNil: ['contributions by myself']
				ifNotNil: [:initials | 'contributions by myself ({1})' format: {initials}])
			put: #author;
		at: 'contributions in which I was mentioned' put: #mentioned;
		at: 'contributions in which I have engaged' put: #participated;
		at: 'contributions in which I received replies' put: #newReplies;
		yourself