support
mockMailSender

	self patch: MailSender at: #userEmail withValue: self selector, '@example.org'