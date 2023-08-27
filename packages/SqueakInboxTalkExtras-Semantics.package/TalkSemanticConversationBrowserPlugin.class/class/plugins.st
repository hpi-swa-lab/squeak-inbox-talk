accessing
plugins

	^ Plugins ifNil:
		[Plugins := WeakKeyDictionary new.
		WeakArray addWeakDependent: Plugins.
		Plugins]