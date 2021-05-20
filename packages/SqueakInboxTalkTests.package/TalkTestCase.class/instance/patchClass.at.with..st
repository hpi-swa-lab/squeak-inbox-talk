patching
patchClass: aBehavior at: selector with: patchBlock

	| methodWrapper |
	methodWrapper := TalkTestMethodWrapper
		behavior: aBehavior
		selector: selector
		block: patchBlock.
	methodWrappers add: methodWrapper install.
	^ aBehavior