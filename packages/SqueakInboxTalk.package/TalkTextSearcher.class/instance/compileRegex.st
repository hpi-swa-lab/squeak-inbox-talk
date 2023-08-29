private
compileRegex

	| pattern |
	pattern := self term.
	
	self matchesWholeWord ifTrue: [pattern := '\\<{1}\\>' format: {pattern}].
	
	^ RxParser preferredMatcherClass
		for: (RxParser new parse: pattern)
		ignoreCase: self matchesCase not