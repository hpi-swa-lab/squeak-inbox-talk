actions
reply

	| replyMessage |
	replyMessage := (self selectedActualMessage ifNil: [^ self]) newDecoratedReply.
	^ (TalkInboxBrowser on: self inbox) editDecoratedMailMessage: replyMessage