accessing - state
browseAttachmentsColor

	| attachmentNames defaultButtonColor hasAttachments |
	defaultButtonColor := (self userInterfaceTheme get: #color for: #PluggableButtonMorph) ifNil: [Color gray: 0.91].
	self shouldDecorateButtons ifFalse: [^ defaultButtonColor].
	
	attachmentNames := self selectedActualMessage ifNotNil: #attachmentNames.
	hasAttachments := attachmentNames isEmptyOrNil not.
	^ {
		defaultButtonColor.
		Color tan lighter.
	} at: hasAttachments asBit + 1