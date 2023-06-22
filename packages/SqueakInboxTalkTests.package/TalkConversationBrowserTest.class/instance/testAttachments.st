tests
testAttachments

	browser selectMessage: browser actualMessages first.
	self deny: (browser text asString includesSubstring: 'Attachment').
	
	browser selectMessage: browser actualMessages third.
	self assert: (browser text asString includesSubstring: browser selectedMessage attachmentNames first).