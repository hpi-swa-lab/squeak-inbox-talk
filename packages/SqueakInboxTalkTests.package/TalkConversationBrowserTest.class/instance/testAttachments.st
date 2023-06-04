tests
testAttachments

	browser selectMessage: browser messages first.
	self deny: (browser text asString includesSubstring: 'Attachment').
	
	browser selectMessage: browser messages third.
	self assert: (browser text asString includesSubstring: browser selectedMessage attachmentNames first).