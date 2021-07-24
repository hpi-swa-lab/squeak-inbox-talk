private
predicateStringFor: evaluable
	"Answer a string representation of the evaluable that could be compiled again as a predicate."

	self flag: #moveUpstream.
	"We have pretty much the same logic in InspectorField. Probably this should be moved into BlockClosure at some day."
	evaluable ifNil: [^ nil].
	evaluable isCompiledCode ifTrue: [^ evaluable getSource].
	^ InspectorField
		generateExpressionFrom: evaluable
		argumentNames: {self argumentNameForConversation}