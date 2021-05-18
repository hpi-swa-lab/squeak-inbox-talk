running
performTest

	^ [super performTest] on: SITPatchContextRequired do: [ | case |
		case := self class selector: self selector.
		case turnOnPatchContextDuring: [case runCaseWithoutTimeout]]