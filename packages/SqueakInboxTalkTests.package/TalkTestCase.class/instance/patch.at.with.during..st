patching
patch: anObject at: selector with: patchBlock during: workBlock

	| methodWrapper |
	methodWrapper := TalkTestMethodWrapper object: anObject selector: selector block: patchBlock.
	^ methodWrapper installDuring: workBlock