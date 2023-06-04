tests
testMessageFormat

	browser selectMessage: browser messages first.
	self assert: browser selectedMessage richText ~= browser selectedMessage plainText.
	self assert: (browser text printHtmlString includesSubstring: browser selectedMessage richText printHtmlString).
	self patch: browser messages first at: #attachmentNames withValue: #('attachment.html').
	self assert: browser hasMessageSelectedWithRichText.
	
	browser messageFormat: #plainText.
	self assert: (browser text asString includesSubstring: browser selectedMessage plainText).
	browser messageFormat: #rawText.
	self assert: (browser text asString includesSubstring: browser selectedMessage rawText).
	browser messageFormat: #richText.
	self assert: (browser text asString includesSubstring: browser selectedMessage richText).
	
	browser selectMessage: browser messages second.
	self assert: (browser text asString includesSubstring: browser selectedMessage plainText).
	self deny: browser hasMessageSelectedWithRichText.