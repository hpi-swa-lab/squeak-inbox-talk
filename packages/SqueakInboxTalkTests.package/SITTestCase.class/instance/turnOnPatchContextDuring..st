patching - private
turnOnPatchContextDuring: aBlock

	^ [
		(SITPatchContext newFrom: thisContext)
			patchProvider: self;
			runSimulated: aBlock]
		on: Error, Warning, Halt
		do: [:ex | ToolSet debugException: ex]