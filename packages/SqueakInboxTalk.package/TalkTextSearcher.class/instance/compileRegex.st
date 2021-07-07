private
compileRegex

	| pattern |
	pattern := self term.
	self matchesWholeWord ifTrue: [pattern := '(?<!\w)({1})(?<!\w)' format: {pattern}].
	^ RxParser preferredMatcherClass
		for: (RxParser new parse: pattern)
		ignoreCase: self matchesCase not