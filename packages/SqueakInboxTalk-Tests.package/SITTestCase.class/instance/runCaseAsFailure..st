running
runCaseAsFailure: aSemaphore

	^ [super runCaseAsFailure: aSemaphore]
		on: SITPatchContextRequired
		do: [ | case |
			case := self class selector: self selector.
			(SITPatchContext newFrom: [[case runCaseWithoutTimeout] ensure: [aSemaphore signal]] asContext)
				patchProvider: case;
				debug]