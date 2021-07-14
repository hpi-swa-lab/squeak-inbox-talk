actions
reply

	| replyMessage |
	replyMessage := (self selectedMessage ifNil: [^ self]) newDecoratedReply.
	^ (TalkInboxBrowser on: self inbox) editDecoratedMailMessage: replyMessage