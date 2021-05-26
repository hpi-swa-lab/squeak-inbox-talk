actions
reply

	| replyMessage |
	replyMessage := (self selectedMessage ifNil: [^ self]) newReply.
	MailComposition openOn: replyMessage