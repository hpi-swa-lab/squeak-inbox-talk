printing
textColorForError

	^ TextColor color:
		((UserInterfaceTheme current get: #errorColor for: #TestRunner)
			ifNil: [Color red])