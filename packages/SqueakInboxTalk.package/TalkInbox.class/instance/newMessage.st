sending messages
newMessage

	| message |
	message := self mailingList newMessage.
	message
		from: MailSender userEmail;
		to: self mailAddress;
		body: (self newMessageBodyFor: message body content).
	^ message