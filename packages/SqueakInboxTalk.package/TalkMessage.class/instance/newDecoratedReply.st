sending messages
newDecoratedReply

	| receivers ccReceivers bodyString |
	receivers := ({self inbox mailAddress. self mail replyReceiver}, self mail receivers) withoutDuplicates.
	ccReceivers := self mail ccReceivers.
	bodyString := '{1}\\{2}' withCRs asText format: {self inbox decorateMessage: ''. self textQuoted}.
	
	^ self mail newReply
		from: MailSender userEmail;
		to: (receivers joinSeparatedBy: ', ');
		cc: (ccReceivers joinSeparatedBy: ', ');
		subject: self replySubject;
		body: (self inbox newMessageBodyFor: bodyString);
		yourself