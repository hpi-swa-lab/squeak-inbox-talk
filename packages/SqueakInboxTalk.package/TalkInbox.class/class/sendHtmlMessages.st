preferences
sendHtmlMessages
	<preference: 'Send HTML messages' category: #'Squeak Inbox Talk' description: 'When enabled, outgoing messages will be sent as formatted HTML messages. Otherwise, plain text will be used. Experimental.' type: #Boolean>

	^ SendHtmlMessages ifNil: [false]