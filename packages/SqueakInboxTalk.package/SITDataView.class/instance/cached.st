caching
cached
	"self becomeForward:"

	self flag: #workaround.
	"disabled for optimization - primitive 248 is embarrassingly slow at the moment"
	^ self class cache at: self ifAbsentPut: [self]