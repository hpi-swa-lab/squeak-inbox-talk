accessing
messages

	| messages |
	messages := self actualMessages ifNil: [^ nil].
	self shouldIncludeSmartSummary ifTrue: [
		messages := messages copyWithFirst: #smartSummary].
	^ messages