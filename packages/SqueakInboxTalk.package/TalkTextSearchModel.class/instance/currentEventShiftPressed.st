private
currentEventShiftPressed

	self flag: #workaround.
	"We definitively do not want this method, but for some extremely weird unknown reason, monkey-patching in the tests did not work for #currentEvent (maybe an unflushed cache in the VM's symbol table), thus we provide a separate entry point for patching through this method. See TalkConversationBrowserTest >> #testSearchAndNavigate. But this is really something that should be investigated further ..."
	^ self currentEvent shiftPressed