patching - private
turnOnPatchContext

	self flag: #todo.
	"It would be nicer to use #wrapTest: here, but SimulationContext cannot handle this at the moment."
	self flag: #todo.
	"Use MethodWrappers instead?"
	(thisContext isKindOf: SITPatchContext) ifTrue: [^ self].
	SITPatchContextRequired signal