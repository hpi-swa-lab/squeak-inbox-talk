patching - private
patchFor: anObject at: selector put: patchBlock during: aBlock

	| previousPatch |
	patchBlock ifNil: [self error: 'patchBlock cannot be nil'].
	
	previousPatch := self patchFor: anObject at: selector ifAbsent: [nil].
	self patchFor: anObject at: selector put: patchBlock.
	^ aBlock ensure: [
		(self patchFor: anObject at: selector ifAbsent: [nil]) == patchBlock ifTrue: [
			previousPatch
				ifNil: [self removePatchFor: anObject at: selector]
				ifNotNil: [self patchFor: anObject at: selector put: previousPatch]]]