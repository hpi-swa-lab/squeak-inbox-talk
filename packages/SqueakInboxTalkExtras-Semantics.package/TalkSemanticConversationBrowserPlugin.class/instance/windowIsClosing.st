updating
windowIsClosing

	super windowIsClosing.
	
	backgroundProcesses ifNotNil:
		[backgroundProcesses do: [:process | process terminate]].