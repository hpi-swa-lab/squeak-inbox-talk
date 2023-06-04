preferences
editMessageSignature
	"self editMessageSignature"

	| signature |
	signature := self sendHtmlMessages
		ifTrue: [self messageSignature asTextFromHtml]
		ifFalse: [self messageSignature].
	Project uiManager
		edit: signature
		label: 'Squeak Inbox Talk message signature'
		shouldStyle: false
		accept: [:answer | self messageSignature: (self sendHtmlMessages ifTrue: [answer asStringToHtml] ifFalse: [answer])]