caching
cached
	"Answer an already cached version of the receiver from the global pool, or add the receiver to this pool if not yet present."
	"self becomeForward:"

	self flag: #workaround.
	"disabled for optimization - primitive 248 is embarrassingly slow at the moment"
	^ self class cache at: self ifAbsentPut: [self]