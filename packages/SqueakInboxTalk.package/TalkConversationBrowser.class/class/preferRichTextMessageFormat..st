preferences
preferRichTextMessageFormat: aBoolean

	self defaultMessageFormat: (aBoolean ifTrue: [#richText] ifFalse: [#plainText]).