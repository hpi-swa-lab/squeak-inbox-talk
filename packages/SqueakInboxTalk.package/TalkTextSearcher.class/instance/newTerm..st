accessing
newTerm: aString

	| oldTerm |
	oldTerm := self term.
	term := aString.
	[self update] ifCurtailed: [term := oldTerm]