sending messages
decorateMessage: aStringOrText

	| signatureText |
	signatureText := self messageSignature.
	signatureText isEmptyOrNil ifTrue: [^ aStringOrText].
	
	self sendHtmlMessages ifTrue: [signatureText := signatureText asTextFromHtml].
	^ '{1}\\{2}' withCRs asText format: {aStringOrText. signatureText}