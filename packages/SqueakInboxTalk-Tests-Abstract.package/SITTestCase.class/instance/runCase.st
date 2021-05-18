running
runCase

	^ [super runCase] on: SITPatchContextRequired do: [ | case |
		case := self class selector: self selector.
		case turnOnPatchContextDuring: [case runCaseWithoutTimeout]]