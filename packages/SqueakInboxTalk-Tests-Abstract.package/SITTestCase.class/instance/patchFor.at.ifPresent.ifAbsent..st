patching - private
patchFor: anObject at: selector ifPresent: presentBlock ifAbsent: absentBlock

	^ (patches ifNil: [^ absentBlock value])
		at: anObject
		ifPresent: [:selPatches | selPatches at: selector ifPresent: presentBlock ifAbsent: absentBlock]
		ifAbsent: absentBlock