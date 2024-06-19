updating
windowIsClosing

	super windowIsClosing.
	
	self cancelSmartSummary.
	backgroundProcesses ifNotNil:
		[backgroundProcesses do: [:process | process terminate]].
	smartSummaryConversation ifNotNil:
		[smartSummaryConversation releaseForEventReceiver: self].