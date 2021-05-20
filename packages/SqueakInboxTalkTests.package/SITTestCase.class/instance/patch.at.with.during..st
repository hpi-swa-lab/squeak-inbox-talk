patching
patch: anObject at: selector with: patchBlock during: workBlock

	| methodWrapper |
	methodWrapper := SITTestMethodWrapper object: anObject selector: selector block: patchBlock.
	^ methodWrapper installDuring: workBlock