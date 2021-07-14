actions
sendFeedbackTo: mailAddress

	self editMailMessage: (MailMessage new
		subject: ('[{1}] Feedback' format: {self appName});
		from: MailSender userEmail;
		to: mailAddress;
		body: (self inbox newMessageBodyFor: self class defaultFeedbackText);
		yourself)