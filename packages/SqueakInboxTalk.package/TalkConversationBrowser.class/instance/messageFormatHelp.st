accessing - state
messageFormatHelp

	| help |
	help := 'Preferred message format'.
	self hasActualMessageSelected ifFalse: [^ help].
	
	^ '{1}\\{2}' withCRs format: {help.
		self hasMessageSelectedWithRichText
			ifTrue: ['This message is available in rich text.']
			ifFalse: ['This message is not available in rich text.']}