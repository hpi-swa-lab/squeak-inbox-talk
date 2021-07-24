support
editMailMessage: aMailMessage decorate: aBoolean
	"Spawn a mail message editor which the user can send the passed mail message from. If aBoolean is true, decorate it with the optional message signature."

	| editor |
	editor := MailComposition new
		on: aMailMessage;
		yourself.
	aBoolean ifTrue: [editor messageText: (self inbox decorateMessage: editor messageText)].
	^ ToolBuilder open: editor