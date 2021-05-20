patching
patchClass: aBehavior at: selector with: patchBlock during: workBlock

	| methodWrapper |
	methodWrapper := TalkTestMethodWrapper
		behavior: aBehavior
		selector: selector
		block: patchBlock.
	^ methodWrapper installDuring: workBlock