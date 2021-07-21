tests
testAccepts
	"isAuthor hasParticipated wasMentioned involvementState"
	<resumable>

	#(#(false false false nil) #(false false true #mentioned) #(false true false #newReply) #(false true false #lastWord) #(false true true #newReply) #(false true true #lastWord) #(true true false #newReply) #(true true false #lastWord) #(true true true #newReply) #(true true true #lastWord)) do: [:spec | | isAuthor hasParticipated wasMentioned involvementState conversation filter |
		isAuthor := spec first.
		hasParticipated := spec second.
		wasMentioned := spec third.
		involvementState := spec fourth.
		
		conversation := Object new.
		self
			patch: conversation at: #includesAuthor: withValue: isAuthor;
			patch: conversation at: #includesParticipationOf: withValue: hasParticipated;
			patch: conversation at: #includesMentionOf: withValue: wasMentioned;
			patch: conversation at: #involvementStateFor: withValue: involvementState.
		
		filter := self classUnderTest new.
		self assert: (filter accepts: conversation).
		
		filter
			reset;
			setInvolvement: #author to: true.
		self assert: isAuthor equals: (filter accepts: conversation).
		
		filter
			reset;
			setInvolvement: #participated to: true.
		self
			assert: (isAuthor not and: [hasParticipated])
			equals: (filter accepts: conversation)
			description: '#(#participated)'.
		
		filter
			reset;
			setInvolvement: #newReplies to: true.
		self
			assert: involvementState = #newReply
			equals: (filter accepts: conversation)
			description: '#(#newReplies)'.
		
		filter
			reset;
			setInvolvement: #mentioned to: true.
		self assert: wasMentioned equals: (filter accepts: conversation) description: '#(#mentioned)'.
		
		filter
			reset;
			setInvolvement: #author to: true;
			setInvolvement: #participated to: true.
		self
			assert: hasParticipated
			equals: (filter accepts: conversation)
			description: '#(#author #participated)'.
		
		filter
			reset;
			setInvolvement: #author to: true;
			setInvolvement: #newReplies to: true.
		self
			assert: (isAuthor and: [involvementState = #newReply])
			equals: (filter accepts: conversation)
			description: '#(#author #newReplies)'.
		
		filter
			reset;
			setInvolvement: #author to: true;
			setInvolvement: #mentioned to: true.
		self
			assert: (isAuthor or: [isAuthor not and: [wasMentioned]])
			equals: (filter accepts: conversation)
			description: '#(#author #mentioned)'.
		
		filter
			reset;
			setInvolvement: #paticipated to: true;
			setInvolvement: #newReplies to: true.
		self
			assert: (hasParticipated and: [involvementState = #newReply])
			equals: (filter accepts: conversation)
			description: '#(#participated #newReplies)'.
		
		filter
			reset;
			setInvolvement: #paticipated to: true;
			setInvolvement: #mentioned to: true.
		self
			assert: wasMentioned
			equals: (filter accepts: conversation)
			description: '#(#participated #mentioned)'.
		
		filter
			reset;
			setInvolvement: #paticipated to: true;
			setInvolvement: #newReplies to: true;
			setInvolvement: #mentioned to: true.
		self
			assert: ((hasParticipated and: [involvementState = #newReply]) or: [wasMentioned])
			equals: (filter accepts: conversation)
			description: '#(#participated #newReplies #mentioned)'.
		
		filter
			reset;
			setInvolvement: #newReplies to: true;
			setInvolvement: #mentioned to: true.
		self
			assert: (involvementState = #newReply or: [wasMentioned])
			equals: (filter accepts: conversation)
			description: '#(#newReplies #mentioned)']