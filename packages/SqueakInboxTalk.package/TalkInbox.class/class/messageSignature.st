preferences
messageSignature
	<preference: 'Message signature' category: #'Squeak Inbox Talk' description: 'A standard text that is appended to every message created by you. You can edit or remove the signature before sending a message. NOTE: If #sendHtmlMessages is enabled, the signature is interpreted as an HTML string. For better convenience, do [TalkInbox editMessageSignature] instead.' type: #String>

	^ MessageSignature ifNil: ['']