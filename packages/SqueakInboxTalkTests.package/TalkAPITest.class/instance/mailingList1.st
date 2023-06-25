accessing - fixtures
mailingList1

	| commitText |
	commitText := 'A new version of Squeakland was added to project The Inbox:
http://exanoke.com/inbox/Squeakland-author.123.mcz

==================== Summary ====================

Name: Squeakland-author.123.mcz
Author: author
Time: 7 May 2021, 12:34:56.7889 am
UUID: 9b1deb4d-3b7d-4bad-9bdd-2b0d7b3dcb6d
Ancestors: Squeakland-author0.122.mcz

Add X.

=============== Diff against Squeakland-author0.122.mcz ===============

Usually here would be some more helpful information.' withCRs.
	^ self
		mailingListNamed: 'mail-1'
		address: '1@mails.com'
		mails: [:list |
			{
				JsonObject new
					at: #attachmentNames put: #();
					at: #author put: 'pepito.perez@hotmail.com';
					at: #ccReceivers put: #();
					at: #date put: (DateAndTime fromString: '2020-06-09T14:37:19.01234-03:00');
					at: #mailingList put: list;
					at: #messageId put: 'msg1@email';
					at: #plainText put: '42' withCRs;
					at: #receivers put: {list mailAddress. 'john.doe@gmx.net'};
					at: #replyTo put: 'pepito.perez@hotmail.com';
					at: #rawText put: 'Content: 42' withCRs;
					at: #richText put: '*42*' withCRs;
					at: #subject put: 'Re: Hello world';
					at: #text put: '42' withCRs;
					yourself.
				JsonObject new
					at: #attachmentNames put: #('attachment.html');
					at: #author put: 'john.doe@gmx.net';
					at: #ccReceivers put: #();
					at: #date put: (DateAndTime fromString: '2020-06-09T19:35:21.01231+02:00');
					at: #mailingList put: list;
					at: #messageId put: 'msg2.5@email';
					at: #plainText put: 'Well spoken. Carpe Squeak!\\Best regards,\John' withCRs;
					at: #rawText put: 'Content: Well spoken. Carpe Squeak!\\Best regards,\John' withCRs;
					at: #receivers put: {list mailAddress};
					at: #replyTo put: nil;
					at: #richText put: 'Well spoken. *Carpe Squeak!*\\Best regards,\John' withCRs;
					at: #subject put: 'Re: What is your favorite language?';
					at: #text put: 'Well spoken. Carpe Squeak!\\Best regards,\John' withCRs;
					yourself.
				JsonObject new
					at: #attachmentNames put: #();
					at: #author put: 'john.doe@gmx.net';
					at: #ccReceivers put: #();
					at: #date put: (DateAndTime fromString: '2020-06-09T19:35:21.01228+02:00');
					at: #mailingList put: list;
					at: #messageId put: 'msg2@email';
					at: #plainText
						put: 'What is the answer to the ultimate question of life, the universe, and everything?\\Best regards,\John' withCRs;
					at: #rawText
						put: 'Content: What is the answer to the ultimate question of life, the universe, and everything?\\Best regards,\John' withCRs;
					at: #receivers put: {list mailAddress};
					at: #replyTo put: nil;
					at: #richText
						put: 'What is the answer to the ultimate question of life, the universe, and everything?\\Best regards,\John' withCRs;
					at: #subject put: 'Hello world';
					at: #text
						put: 'What is the answer to the ultimate question of life, the universe, and everything?\\Best regards,\John' withCRs;
					yourself.
				JsonObject new
					at: #attachmentNames put: #();
					at: #author put: 'pepito.perez@hotmail.com';
					at: #ccReceivers put: #();
					at: #date put: (DateAndTime fromString: '2020-05-09T14:37:19.01234-03:00');
					at: #mailingList put: list;
					at: #messageId put: 'msg3@email';
					at: #plainText
						put: '> Is there any simpler programming language than Smalltalk in the world?\\How dare you??? It isn''t ... Smalltalk is simple, and simply perfect!!' withCRs;
					at: #rawText
						put: '> Is there any simpler programming language than Smalltalk in the world?\\How dare you??? It isn''t ... Smalltalk is simple, and simply perfect!!' withCRs;
					at: #receivers put: {list mailAddress. 'si-squeak@polan.id'};
					at: #replyTo put: 'pepito.perez@hotmail.com';
					at: #richText
						put: '> Is there any simpler programming language than Smalltalk in the world?\\How dare you??? It isn''t ... Smalltalk is simple, and simply perfect!!' withCRs;
					at: #subject put: 'Re: What is your favorite language?';
					at: #text
						put: '> Is there any simpler programming language than Smalltalk in the world?\\How dare you??? It isn''t ... Smalltalk is simple, and simply perfect!!' withCRs;
					yourself.
				JsonObject new
					at: #attachmentNames put: #('image.png');
					at: #author put: 'si@polan.id';
					at: #ccReceivers put: #();
					at: #date put: (DateAndTime fromString: '2020-05-08T21:44:44.0444+02:00');
					at: #mailingList put: list;
					at: #messageId put: 'msg4@email';
					at: #plainText
						put: 'Is there any simpler programming language than Smalltalk in the world?' withCRs;
					at: #rawText
						put: 'Content: Is there any simpler programming language than Smalltalk in the world?' withCRs;
					at: #receivers put: {list mailAddress};
					at: #replyTo put: nil;
					at: #richText
						put: 'Is there any simpler programming language than Smalltalk in the world?' withCRs;
					at: #subject put: 'What is your favorite language?';
					at: #text
						put: 'Is there any simpler programming language than Smalltalk in the world?' withCRs;
					yourself.
				JsonObject new
					at: #attachmentNames put: #();
					at: #author put: 'commits@source.squeak.org';
					at: #ccReceivers put: #();
					at: #date put: (DateAndTime fromString: '2020-05-07T12:34:56.7890+01:00');
					at: #mailingList put: list;
					at: #messageId put: 'msg5@email';
					at: #plainText put: commitText;
					at: #rawText put: 'Content: ' , commitText;
					at: #receivers put: {list mailAddress};
					at: #replyTo put: list mailAddress;
					at: #richText put: commitText;
					at: #subject put: 'The Inbox: Squeakland-author.123.mcz';
					at: #text put: commitText;
					yourself}]
		conversations: [:list :mails |
			{
				JsonObject new
					at: #mails put: (mails select: [:mail | #('msg1@email' 'msg2@email') includes: mail messageId]);
					at: #subject put: 'Hello world';
					yourself.
				JsonObject new
					at: #mails put: (mails select: [:mail | #('msg2.5@email' 'msg3@email' 'msg4@email') includes: mail messageId]);
					at: #subject put: 'What is your favorite language?';
					yourself.
				JsonObject new
					at: #mails put: (mails select: [:mail | #('msg5@email') includes: mail messageId]);
					at: #subject put: 'The Inbox: Squeakland-author.123.mcz';
					yourself}]