swapping
swapInFromDisk

	super swapInFromDisk.
	
	documentsPerMessage := IdentityDictionary new.
	self documents do: [:document |
		(self documentsPerMessage at: document message ifAbsentPut: [Set new])
			add: document].