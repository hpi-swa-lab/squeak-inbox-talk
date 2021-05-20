accessing
messages

	^ self mailConversation mails collect: [:mail | TalkMessage on: mail]