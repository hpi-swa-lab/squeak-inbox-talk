patching
patch: anObject at: selector withValue: patchValue during: workBlock

	^ self patch: anObject at: selector with: [patchValue] during: workBlock