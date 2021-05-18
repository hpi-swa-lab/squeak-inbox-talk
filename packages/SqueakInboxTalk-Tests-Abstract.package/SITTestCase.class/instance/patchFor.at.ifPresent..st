patching - private
patchFor: anObject at: selector ifPresent: presentBlock

	^ self patchFor: anObject at: selector ifPresent: presentBlock ifAbsent: [nil]