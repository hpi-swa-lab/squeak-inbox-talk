accessing
mails

	^ ((TalkMailingList aggregatorClass conversations at: self wrapper) collect: [:eachWrapper | TalkMailObject on: eachWrapper]) reversed talkInsertionSorted: #date ascending
	"sorted: #date ascending
		optimized (~12% faster)"