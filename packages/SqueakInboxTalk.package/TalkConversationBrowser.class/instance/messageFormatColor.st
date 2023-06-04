accessing - state
messageFormatColor

	| defaultButtonColor |
	defaultButtonColor := (self userInterfaceTheme get: #color for: #PluggableButtonMorph) ifNil: [Color gray: 0.91].
	self shouldDecorateButtons ifFalse: [^ defaultButtonColor].
	
	^ {
		defaultButtonColor.
		Color green muchLighter.
	} at: self hasMessageSelectedWithRichText asBit + 1