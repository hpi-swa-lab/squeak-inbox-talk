running
downloadEnoughFromInbox

	| range |
	range := 10 days.
	person := nil.
	[inbox downloadRange: range.
		"(((TalkInbox squeakDev messages sorted: #date descending)
			select: [:ea | ea date year >= 2015])
				pairsCollect: [:a :b | a date - b date])
					max.
		-> 6:05:50:33"
	inbox refreshMessages.
	self personCandidates
		detect: [:candidate |
			"candidate must have started at least one conversation in the downloaded time range
			(we express that so low-level here to avoid false positive tests)"
			inbox messages anySatisfy: [:ea |
				(ea subject talkBeginsWith: 'Re:' caseSensitive: false) not and: [
					candidate hasMailAddress: ea author]]]
		ifFound: [:candidate |
			person := candidate].
	person] whileNil:
		[range := range + 10 days].
	^ person