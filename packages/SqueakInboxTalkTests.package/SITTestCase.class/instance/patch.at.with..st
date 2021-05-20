patching
patch: anObject at: selector with: patchBlock

	| methodWrapper |
	methodWrapper := SITTestMethodWrapper object: anObject selector: selector block: patchBlock.
	methodWrappers add: methodWrapper install.
	^ anObject