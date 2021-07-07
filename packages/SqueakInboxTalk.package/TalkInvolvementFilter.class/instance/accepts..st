filtering
accepts: aConversation

	((self hasInvolvement: #author) and: [aConversation includesAuthor: self person]) ifTrue: [^ true].
	
	((self hasInvolvement: #mentioned)
		and: [aConversation includesMentionOf: self person]
		and: [(self hasInvolvement: #author) not ==> [(aConversation includesAuthor: self person) not]]
		and: [(self hasInvolvement: #participated) not ==> [(aConversation includesParticipationOf: self person) not]]) ifTrue: [^ true].
	
	((self hasInvolvement: #participated)
		and: [aConversation includesParticipationOf: self person]
		and: [(self hasInvolvement: #author) not ==> [(aConversation includesAuthor: self person) not]]) ifTrue: [^ true].
	
	((self hasInvolvement: #newReplies) and: [(aConversation involvementStateFor: self person) = #newReply]) ifTrue: [^ true].
	
	^ false