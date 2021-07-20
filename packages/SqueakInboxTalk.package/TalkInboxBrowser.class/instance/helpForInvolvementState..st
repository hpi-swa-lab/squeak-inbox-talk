accessing - toolbuilder
helpForInvolvementState: aConversation

	^ aConversation involvementState
		caseOf: {
			[#mentioned] -> ['You were <b>mentioned</b> in this conversation.' asTextFromHtml].
			[#newReply] -> ['This conversation has received <b>new replies</b> since your last message.' asTextFromHtml].
			[#lastWord] -> ['The <b>latest reply</b> to this conversation is by <b>you.</b>' asTextFromHtml]}
		otherwise: #yourself