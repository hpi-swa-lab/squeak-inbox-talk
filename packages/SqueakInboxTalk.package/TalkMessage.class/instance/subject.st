accessing
subject

	| subject |
	subject := self mail subject.
	subject := subject withBlanksTrimmed.
	subject := (subject talkWithoutLeading: ('[{1}]' format: {self inbox name}) caseSensitive: false) withBlanksTrimmed.
	^ subject