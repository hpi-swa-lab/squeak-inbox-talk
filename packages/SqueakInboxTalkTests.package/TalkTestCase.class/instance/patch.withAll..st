patching
patch: anObject withAll: aDictionary

	aDictionary keysAndValuesDo: [:selector :patchBlock | self patch: anObject at: selector with: patchBlock].
	^ anObject