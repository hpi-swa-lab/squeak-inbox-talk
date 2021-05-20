patching - private
patchFor: anObject at: selector put: patch

	^ ((patches ifNil: [patches := IdentityDictionary new])
		at: anObject
		ifAbsentPut: [IdentityDictionary new])
		at: selector
		put: patch