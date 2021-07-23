actions
selectNextMatch: forward
	"Select the next match for the current search, or the previous one if the boolean forward is set to false"

	| matches firstMatch previousMatch currentMatch |
	matches := self messages talkAsGenerator gather: [:message | searchModel safeMatchesIn: message].
	matches := matches
		talkGroupBy: [:match | match object]
		thenGather: [:group | group sorted: [:match | #('Subject' 'From' 'Date' nil) indexOf: match label] ascending].
	matches atEnd ifTrue: [^ false].
	
	firstMatch := matches peek.
	currentMatch := nil.
	(forward not and: [selectedMatch isNil]) ifTrue: [selectedMatch := firstMatch].
	selectedMatch ifNotNil: [
		[
			previousMatch := currentMatch.
			currentMatch := matches next] doWhileFalse: [(matches atEnd or: [currentMatch = selectedMatch]) and: [forward or: [previousMatch notNil]]]].
	(selectedMatch = firstMatch and: [currentMatch notNil]) ifTrue: [previousMatch := currentMatch].
	currentMatch := matches atEnd ifTrue: [firstMatch] ifFalse: [matches next].
	
	self selectMatch: (forward ifTrue: [currentMatch] ifFalse: [previousMatch])