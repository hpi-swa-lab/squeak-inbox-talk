private
predicateStringFor: evaluable

	evaluable ifNil: [^ nil].
	evaluable isCompiledCode ifTrue: [^ evaluable getSource].
	^ InspectorField generateExpressionFrom: evaluable argumentNames: #('each')