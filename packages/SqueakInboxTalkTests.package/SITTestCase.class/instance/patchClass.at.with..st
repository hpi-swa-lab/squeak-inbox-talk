patching
patchClass: aBehavior at: selector with: patchBlock

	| methodWrapper |
	methodWrapper := SITTestMethodWrapper
		behavior: aBehavior
		selector: selector
		block: patchBlock.
	methodWrappers add: methodWrapper install.
	^ aBehavior