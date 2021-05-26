feedback
sendFeedbackTo: mailAddress

	MailComposition openOn: (MailMessage new
		subject: ('[{1}] Feedback' format: {self appName});
		from: MailSender userEmail;
		to: mailAddress;
		body: (MIMEDocument
			contentType: MIMEDocument contentTypePlainText
			content: self defaultFeedbackText asString);
		yourself)