updating
windowIsClosing
	"Propagate to nested models such as plugins."

	self triggerEvent: #windowIsClosing.
	
	super windowIsClosing.