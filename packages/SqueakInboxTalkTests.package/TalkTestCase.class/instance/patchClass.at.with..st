patching
patchClass: aBehavior at: selector with: patchBlock

	| methodWrapper |
	(self patchLevelOfClass: aBehavior at: selector) > (methodWrappers count: [:wrapper | wrapper methodClass = aBehavior and: [wrapper selector = selector]]) ifTrue: [self error: 'Cannot install methodWrapper on top of execute around wrapper'].
	
	methodWrapper := TalkTestMethodWrapper
		behavior: aBehavior
		selector: selector
		block: patchBlock.
	methodWrappers add: methodWrapper install.
	^ aBehavior