preferences
preferRichTextMessageFormat
	<preference: 'Prefer displaying messages in rich text format' category: #'Squeak Inbox Talk' description: 'If enabled, messages in the conversation browser will be displayed in rich text format by default. Might affect performance. You can always change this in an individual browser window.' type: #Boolean>

	^ self defaultMessageFormat = #richText