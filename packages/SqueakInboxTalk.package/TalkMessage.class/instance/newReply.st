replying
newReply

	| receivers ccReceivers bodyString |
	receivers := ({self inbox mailAddress. self mail replyReceiver}, self mail receivers) withoutDuplicates.
	ccReceivers := self mail ccReceivers.
	bodyString := '\\{1}' withCRs format: {self textQuoted}.
	
	^ self mail newReply
		from: MailSender userEmail;
		to: (receivers joinSeparatedBy: ', ');
		cc: (ccReceivers joinSeparatedBy: ', ');
		subject: self replySubject;
		body: (MIMEDocument contentType: MIMEDocument contentTypePlainText content: bodyString);
		yourself