support
editMailMessage: aMailMessage decorate: aBoolean

	| editor |
	editor := MailComposition new
		on: aMailMessage;
		yourself.
	aBoolean ifTrue: [editor messageText: (self inbox decorateMessage: editor messageText)].
	^ ToolBuilder open: editor