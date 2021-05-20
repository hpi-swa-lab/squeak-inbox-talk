patching
patchClass: aBehavior at: selector with: patchBlock during: workBlock

	| methodWrapper |
	methodWrapper := SITTestMethodWrapper
		behavior: aBehavior
		selector: selector
		block: patchBlock.
	^ methodWrapper installDuring: workBlock