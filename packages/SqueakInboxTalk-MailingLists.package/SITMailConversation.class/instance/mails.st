accessing
mails

	^ ((SqhMailmanAggregator conversations at: self wrapper) collect: [:eachWrapper | SITMailObject on: eachWrapper])
		
		"sorted: #date ascending
		optimized (~12% faster)"
		reversed sitInsertionSorted: #date ascending