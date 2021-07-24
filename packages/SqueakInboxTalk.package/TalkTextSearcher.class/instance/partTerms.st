private
partTerms
	"Split the current term into part terms that form a complex term together."

	| patternFull patternMulti patternSingle patternTerm regexFull regexMulti regexSingle termStream |
	(self usesRegex not and: [self hasComplexTerm]) ifFalse: [^ {self term}].
	
	self term withBlanksTrimmed ifEmpty: [^ {self term}].
	
	"split term into single words some of which might be quoted."
	'example:  foo "bar\\ \"baz\"" plong'.
	self flag: #regexFamily.
	patternSingle := '[^\s"]+'.
	patternMulti := '"([^"\\]|\\["\\])+"'.
	regexSingle := patternSingle asRegex.
	regexMulti := patternMulti asRegex.
	patternTerm := '(?%<=^|\s)(<1s>|<2s>)(?=\s|$)'
		expandMacrosWith: patternSingle
		with: patternMulti.
	patternFull := '^(\s*(<1s>)\s*)*$' expandMacrosWith: patternTerm.
	regexFull := patternFull asRegex.
	
	termStream := self term readStream.
	(regexFull matchesStream: termStream) ifFalse: [
		TalkTextSearcherError
			signal: 'invalid search query. \\example query:   ' withCRs, 'term1  "term2 with multiple words"  "escape \"quotes\" and \\backslashes"'
			at: termStream position + 1].
	^ (regexFull subexpressions: 3) collect: [:ea |
		(regexSingle matches: ea) ifTrue: [ea] ifFalse: [
			self assert: (regexMulti matches: ea).
			((regexMulti subexpressions: 2) collect: #last) join]]