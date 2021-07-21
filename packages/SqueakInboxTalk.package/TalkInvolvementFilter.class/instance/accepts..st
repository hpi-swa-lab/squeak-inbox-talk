filtering
accepts: aConversation

	self isActive ifFalse: [^ true].
	
	((self hasInvolvement: #author)
		and: [aConversation includesAuthor: self person]
		and: [(self hasInvolvement: #newReplies) ==> [(aConversation involvementStateFor: self person) = #newReply]]) ifTrue: [^ true].
	
	((self hasInvolvement: #mentioned)
		and: [aConversation includesMentionOf: self person]
		and: [((self hasInvolvement: #participated) or: [self hasInvolvement: #author]) not ==> [((aConversation includesAuthor: self person) or: [aConversation includesParticipationOf: self person]) not]]
		and: [((aConversation includesAuthor: self person) or: [aConversation includesParticipationOf: self person]) ==> [(self hasInvolvement: #newReplies) ==> [(aConversation involvementStateFor: self person) = #newReply]]]) ifTrue: [^ true].
	
	((self hasInvolvement: #participated)
		and: [aConversation includesParticipationOf: self person]
		and: [(self hasInvolvement: #author) not ==> [(aConversation includesAuthor: self person) not]]
		and: [(self hasInvolvement: #newReplies) ==> [(aConversation involvementStateFor: self person) = #newReply]]) ifTrue: [^ true].
	
	((self hasInvolvement: #newReplies)
		and: [(aConversation involvementStateFor: self person) = #newReply]
		and: [(self hasInvolvement: #author) ==> [aConversation includesAuthor: self person]]) ifTrue: [^ true].
	
	^ false