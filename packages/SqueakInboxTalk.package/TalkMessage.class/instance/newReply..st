sending messages
newReply: decorated

	| receivers ccReceivers bodyString |
	receivers := {self inbox mailAddress. self mail replyReceiver} withoutDuplicates.
	ccReceivers := self mail ccReceivers.
	bodyString := '\\{1}' withCRs format: {self textQuoted}.
	decorated ifTrue: [bodyString := (self inbox decorateMessage: '') asText, bodyString].
	
	^ self mail newReply
		from: MailSender userEmail;
		to: (receivers joinSeparatedBy: ', ');
		cc: (ccReceivers joinSeparatedBy: ', ');
		subject: self replySubject;
		body: (self inbox newMessageBodyFor: bodyString);
		yourself