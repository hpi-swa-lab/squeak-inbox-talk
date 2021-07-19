patching
patchClass: aBehavior at: selector withValue: patchValue during: workBlock

	^ self patchClass: aBehavior at: selector with: [patchValue] during: workBlock