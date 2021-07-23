patching
patch: anObject at: selector with: patchBlock

	| methodWrapper |
	(self patchLevelOfClass: anObject class at: selector) > (methodWrappers count: [:wrapper | wrapper methodClass = anObject class and: [wrapper selector = selector]]) ifTrue: [self error: 'Cannot install methodWrapper on top of execute around wrapper'].
	
	methodWrapper := TalkTestMethodWrapper
		object: anObject
		selector: selector
		block: patchBlock.
	methodWrappers add: methodWrapper install.
	^ anObject