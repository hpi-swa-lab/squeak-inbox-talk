accessing
subject

	| subject |
	subject := self mail subject.
	subject := subject withBlanksTrimmed.
	subject := (subject talkWithoutLeading: self inbox subjectPrefix caseSensitive: false) withBlanksTrimmed.
	^ subject