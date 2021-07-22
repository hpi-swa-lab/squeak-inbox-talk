actions
selectNextMatch: next
	"Select the next match for the current search, or the previous one if the boolean next is set to false"

	| matches firstMatch previousMatch currentMatch |
	matches := self messages talkAsGenerator gather: [:message | searchModel safeMatchesIn: message].
	matches := matches
		talkGroupBy: [:match | match object]
		thenGather: [:group | group sorted: [:match | #('Subject' 'From' 'Date' nil) indexOf: match label] ascending].
	matches atEnd ifTrue: [^ false].
	
	firstMatch := matches peek.
	currentMatch := nil.
	selectedMatch ifNotNil: [
		[
			previousMatch := currentMatch.
			currentMatch := matches next] doWhileFalse: [(matches atEnd or: [currentMatch = selectedMatch]) and: [next or: [previousMatch notNil]]]].
	currentMatch := matches atEnd ifTrue: [firstMatch] ifFalse: [matches next].
	
	self selectMatch: (next ifTrue: [currentMatch] ifFalse: [previousMatch])