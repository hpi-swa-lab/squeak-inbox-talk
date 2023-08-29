matching - private
streamIntervalsForWildcard: term in: aString on: aStream
	"Optimized. This is a close equivalent of:
		^ self copy
			doUseRegex;
			newTerm: ((term escapeRegex
				copyReplaceAll: '\*' with: '.*?')
				copyReplaceAll: '#' with: '.');
			intervalsIn: aString
	Importantly, we do non-greedy matches. For stars at the beginning of the term, we select as few characters as possible by going from right to left.
	Note that this is faster than sending #match: for each string position (even though it pushes more stresses onto the GC).
	For plain terms without */#, this is ~25% slower than #intervalsForExact:in:.
	Further room for optimization: Use #indexOf:startingAt: like String>>#match:.
	"

	| termIndex stringIndex stringStart backtracks termCharacter match |
	termIndex := 1.
	stringIndex := 0.
	stringStart := nil.
	backtracks := nil. "note: Stack takes fewer time + gc than OrderedCollection"
	match := nil.
	[(self matchesWholeWord and: [termIndex = 1 and: [stringStart isNil and: [stringIndex > 0]]]) ifTrue:
		[[(aString at: stringIndex) isAlphaNumeric and: [stringIndex < aString size]] whileTrue:
			[(stringIndex := stringIndex + 1) <= aString size ifFalse:
				[^ self]]].
	(termCharacter := (term at: termIndex)) = $*
		ifTrue:
			[(termIndex = term size
				and: [self matchesWholeWord ifFalse: [true] ifTrue:
					[stringIndex = aString size or:
						[(aString at: stringIndex + 1) isAlphaNumeric not]]])
				ifFalse:
					[(backtracks ifNil: [backtracks := Stack new])
						push: {1. nil. stringIndex}. "discard match"
					termIndex < term size
						ifTrue:
							[backtracks push: {termIndex. (self matchesWholeWord and: [stringStart isNil]) ifTrue: [stringIndex + 1] ifFalse: [stringStart]. stringIndex + 1}.  "consume one"
							"consume zero"
							termIndex := termIndex + 1]
						ifFalse:
							["consume zero"
							stringIndex := stringIndex + 1]]
				ifTrue:
					[stringStart ifNil:
						[(stringIndex := stringIndex + 1) <= aString size ifFalse:
							[^ self].
						stringStart := stringIndex].
					aStream nextPut: (stringStart to: stringIndex).
					backtracks := nil.
					termIndex := 1.
					stringStart := nil]]
		ifFalse:
			[(stringIndex := stringIndex + 1) <= aString size ifFalse:
				[^ self].
			stringStart ifNil: [stringStart := stringIndex].
			termCharacter = $#
				ifTrue:
					[termIndex = term size
						ifFalse:
							[(backtracks ifNil: [backtracks := Stack new])
								push: {1. nil. stringIndex}. "discard match"
							"consume"
							termIndex := termIndex + 1]
						ifTrue:
							[match := true]]
				ifFalse:
					[termCharacter = (aString at: stringIndex)
						ifTrue:
							[termIndex = term size
								ifFalse:
									["consume"
									termIndex := termIndex + 1]
								ifTrue:
									[match := true]]
						ifFalse:
							["discard match"
							match := false]]].
		match ifNotNil:
			[(match and:
				[self matchesWholeWord not or:
					[stringIndex = aString size or:
						[(aString at: stringIndex + 1) isAlphaNumeric not]]])
				ifTrue:
					[aStream nextPut: (stringStart to: stringIndex).
					backtracks := nil.
					termIndex := 1.
					stringStart := nil]
				ifFalse:
					[(backtracks isNil or: [backtracks isEmpty])
						ifTrue:
							[termIndex := 1.
							stringStart := nil]
						ifFalse:
							[| backtrack |
							backtrack := backtracks pop.
							termIndex := backtrack first.
							stringStart := backtrack second.
							stringIndex := backtrack third]].
			match := nil]]
	repeat.