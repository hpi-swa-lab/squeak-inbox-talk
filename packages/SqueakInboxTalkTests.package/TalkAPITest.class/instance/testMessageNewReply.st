tests
testMessageNewReply

	| mail message reply inbox |
	self wrapTest: [:block | self resetTalkCachesDuring: block].
	
	mail := self mailingList1 allMails detect: [:ea | ea messageId = -3].
	self
		patch: mail at: #newReply with: [MailMessage new];
		patch: mail at: #ccReceivers withValue: #('carbon@co.py').
	message := self messageClass on: mail.
	inbox := TalkInbox new.
	self patch: inbox at: #mailAddress withValue: '1@mails.com'; patch: inbox class at: #sendHtmlMessages withValue: false.
	self
		patch: message
		at: #inbox
		withValue: inbox.
	self patch: MailSender at: #userEmail withValue: 'sen@d.er'.
	reply := message newReply.
	
	self
		assert: 'sen@d.er' equals: reply from;
		assert: '1@mails.com, pepito.perez@hotmail.com' equals: reply to;
		assert: 'carbon@co.py' equals: reply cc;
		assert: 'Re: What is your favorite language?' equals: reply subject;
		assert: (reply bodyText endsWith: '> > Is there any simpler programming language than Smalltalk in the world?\> \> How dare you??? It isn''t ... Smalltalk is simple, and simply perfect!!' withCRs)