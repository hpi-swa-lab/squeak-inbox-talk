sending messages
newReply

	^ MailMessage empty
		to: (self replyTo ifNil: ['']);
		setField: 'in-reply-to' toString: self messageId;
		setField: 'references' toString: self mailMessage references;
		flag: #moveUpstream;
		yourself
	"#references already compiles the new field string"
	"Maybe we should rename it into sth like #newReferences?"