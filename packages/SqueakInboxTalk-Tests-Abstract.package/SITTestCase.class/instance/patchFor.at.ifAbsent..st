patching - private
patchFor: anObject at: selector ifAbsent: absentBlock

	^ self patchFor: anObject at: selector ifPresent: #yourself ifAbsent: absentBlock