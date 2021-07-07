copying
withSurroundingLines: numberOfLines

	| wideStart wideStop whitespaceMatcher |
	wideStart := self start.
	wideStop := self stop.
	(0 to: numberOfLines)
		detect: [:i | | nextStart |
				nextStart := self contents lastIndexOfAnyOf: String crlf startingAt: wideStart - 1.
				wideStart := nextStart = 0 ifFalse: [nextStart] ifTrue: [1].
				nextStart = 0]
			ifNone: [];
		detect: [:i | | nextStop |
				nextStop := self contents indexOfAnyOf: String crlf startingAt: wideStop + 1.
				wideStop := nextStop = 0 ifFalse: [nextStop] ifTrue: [self contents size].
				nextStop = 0]
			ifNone: [].
	
	"Trim whitespace-only lines from the string excerpt"
	whitespaceMatcher := '\s*(^[^\r\n]*\S[^\r\n]*$(.*^[^\r\n]*\S[^\r\n]*$)*)\s*' asRegex.
	self assert: (whitespaceMatcher matches: (self contents copyFrom: wideStart to: wideStop)).
	
	^ self
		withStart: wideStart + (whitespaceMatcher subBeginning: 2) first
		stop: wideStart + (whitespaceMatcher subEnd: 2) first - 1