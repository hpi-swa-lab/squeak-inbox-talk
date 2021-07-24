accessing
newTerm: aString
	"Install aString as a new term in the receiver. If there is an issue with the new term, signal a syntax error and eventually roll back to the previous term."

	| oldTerm |
	oldTerm := self term.
	term := aString.
	[self update] ifCurtailed: [term := oldTerm]