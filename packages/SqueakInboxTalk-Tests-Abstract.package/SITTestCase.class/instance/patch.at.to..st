patching
patch: anObject at: selector to: patchBlock

	self turnOnPatchContext.
	self wrapTest: [:continue | self patch: anObject at: selector to: patchBlock during: continue].
	^ anObject