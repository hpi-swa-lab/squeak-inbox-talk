accessing - fixtures
mailingList1

	^ self
		mailingListNamed: 'mail-1'
		address: '1@mails.com'
		mails: [:list |
			{
				JsonObject new
					at: #author put: 'pepito.perez@hotmail.com';
					at: #ccReceivers put: #();
					at: #date put: (DateAndTime fromString: '2020-06-09T14:37:19.01234-03:00');
					at: #mailingList put: list;
					at: #messageId put: -1;
					at: #receivers put: {list mailAddress. 'john.doe@gmx.net'};
					at: #replyReceiver put: 'pepito.perez@hotmail.com';
					at: #subject put: 'Re: Hello world';
					at: #text put: '42' withCRs;
					yourself.
				JsonObject new
					at: #author put: 'john.doe@gmx.net';
					at: #ccReceivers put: #();
					at: #date put: (DateAndTime fromString: '2020-06-09T19:35:21.01231+02:00');
					at: #mailingList put: list;
					at: #messageId put: -2.5;
					at: #receivers put: {list mailAddress};
					at: #replyReceiver put: 'john.doe@gmx.net';
					at: #subject put: 'Re: What is your favorite language?';
					at: #text put: 'Well spoken. Carpe Squeak!\\Best regards,\John' withCRs;
					yourself.
				JsonObject new
					at: #author put: 'john.doe@gmx.net';
					at: #ccReceivers put: #();
					at: #date put: (DateAndTime fromString: '2020-06-09T19:35:21.01228+02:00');
					at: #mailingList put: list;
					at: #messageId put: -2;
					at: #receivers put: {list mailAddress};
					at: #replyReceiver put: 'john.doe@gmx.net';
					at: #subject put: 'Hello world';
					at: #text
						put: 'What is the answer to the ultimate question of life, the universe, and everything?\\Best regards,\John' withCRs;
					yourself.
				JsonObject new
					at: #author put: 'pepito.perez@hotmail.com';
					at: #ccReceivers put: #();
					at: #date put: (DateAndTime fromString: '2020-05-09T14:37:19.01234-03:00');
					at: #mailingList put: list;
					at: #messageId put: -3;
					at: #receivers put: {list mailAddress. 'si-squeak@polan.id'};
					at: #replyReceiver put: 'pepito.perez@hotmail.com';
					at: #subject put: 'Re: What is your favorite language?';
					at: #text
						put: '> Is there any simpler programming language than Smalltalk in the world?\\How dare you??? It isn''t ... Smalltalk is simple, and simply perfect!!' withCRs;
					yourself.
				JsonObject new
					at: #author put: 'si@polan.id';
					at: #ccReceivers put: #();
					at: #date put: (DateAndTime fromString: '2020-05-08T21:44:44.0444+02:00');
					at: #mailingList put: list;
					at: #messageId put: -4;
					at: #receivers put: {list mailAddress};
					at: #replyReceiver put: 'si-squeak@polan.id';
					at: #subject put: 'What is your favorite language?';
					at: #text
						put: 'Is there any simpler programming language than Smalltalk in the world?' withCRs;
					yourself.
				JsonObject new
					at: #author put: 'commits@source.squeak.org';
					at: #ccReceivers put: #();
					at: #date put: (DateAndTime fromString: '2020-05-07T12:34:56.7890+01:00');
					at: #mailingList put: list;
					at: #messageId put: -5;
					at: #receivers put: {list mailAddress};
					at: #replyReceiver put: list mailAddress;
					at: #subject put: 'The Inbox: Squeakland-author.123.mcz';
					at: #text
						put: 'A new version of Squeakland was added to project The Inbox:\Usually here would be some more helpful information.' withCRs;
					yourself}]
		conversations: [:list :mails |
			{
				JsonObject new
					at: #mails put: (mails select: [:mail | #(-1 -2) includes: mail messageId]);
					at: #simpleSubject put: 'Hello world';
					yourself.
				JsonObject new
					at: #mails put: (mails select: [:mail | #(-2.5 -3 -4) includes: mail messageId]);
					at: #simpleSubject put: 'What is your favorite language?';
					yourself.
				JsonObject new
					at: #mails put: (mails select: [:mail | #(-5) includes: mail messageId]);
					at: #simpleSubject put: 'The Inbox: Squeakland-author.123.mcz';
					yourself}]