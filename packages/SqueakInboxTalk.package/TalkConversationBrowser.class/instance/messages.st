accessing
messages

	| messages |
	messages := self actualMessages ifNil: [^ nil].
	messages := self specialMessages , messages.
	^ messages