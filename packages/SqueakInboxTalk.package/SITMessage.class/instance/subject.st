accessing
subject

	| subject |
	subject := self mail subject.
	subject := subject withBlanksTrimmed.
	subject := (subject ssiWithoutLeading: ('[{1}]' format: {self inbox name})) withBlanksTrimmed.
	^ subject