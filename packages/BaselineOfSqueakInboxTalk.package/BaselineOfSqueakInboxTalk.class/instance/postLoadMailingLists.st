scripts
postLoadMailingLists

	self isCI ifFalse: [^ self].
	
	self initializeSqhPreferences