testing
hasMessageSelectedWithRichText

	| attachmentNames |
	attachmentNames := (self selectedMessage ifNil: [^ false]) attachmentNames.
	self flag: #hacked. "Only works for non-standardized HyperKitty/pipermail messages but not for correctly structured MIMEDocuments. Would need to implement #hasBodyTextFormatted: on MIMEDocument and forward. see SqhHyperkittyMailWrapper>>#basicRichText."
	^ attachmentNames notEmpty and: [attachmentNames first endsWith: 'html' caseSensitive: false]