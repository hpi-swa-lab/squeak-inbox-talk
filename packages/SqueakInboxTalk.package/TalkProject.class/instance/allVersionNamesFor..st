private
allVersionNamesFor: mcRepositoryLike

	^ (allVersionNames ifNil: [allVersionNames := WeakKeyDictionary new])
		at: mcRepositoryLike
		ifAbsentPut: [mcRepositoryLike allVersionNames]