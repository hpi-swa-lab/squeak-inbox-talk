patching
patch: anObject at: selector toValue: patchValue

	^ self patch: anObject at: selector to: [patchValue]