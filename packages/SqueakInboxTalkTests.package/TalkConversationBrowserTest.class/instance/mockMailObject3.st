accessing
mockMailObject3

	^ self patch: Object new withAllValues: (JsonObject new
		author: 'author3@example.com';
		receivers: {'author2@example.com'. self mockInbox mailAddress};
		replyReceiver: self mockInbox mailAddress;
		ccReceivers: {'someone@el.se'};
		subject: 'mock subject 3';
		newReply: MailMessage empty;
		yourself)