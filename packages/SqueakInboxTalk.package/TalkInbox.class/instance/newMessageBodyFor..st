sending messages
newMessageBodyFor: aStringOrText

	| plainText |
	plainText := MIMEDocument
		contentType: MIMEDocument contentTypePlainText
		content: aStringOrText.
	self class sendHtmlMessages ifFalse: [^ plainText].
	^ MIMEDocument newMultipartAlternative
		addPart: (MIMEDocument
			contentType: MIMEDocument contentTypeHtml
			content: aStringOrText asText asStringToHtml);
		addPart: plainText;
		yourself