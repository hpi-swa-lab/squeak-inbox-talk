accessing
messages

	^ self mailConversation mails collect: [:mail | SITMessage on: mail]