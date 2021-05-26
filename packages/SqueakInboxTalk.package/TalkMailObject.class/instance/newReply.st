replying
newReply

	^ MailMessage empty
		to: self replyReceiver;
		setField: 'in-reply-to' toString: self messageId;
		setField: 'references' toString: self mailMessage references;
		flag: #upstream;
		yourself
	"#references already compiles the new field string"
	"Maybe we should rename it into sth like #newReferences?"