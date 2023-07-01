accessing
personCandidates

	^ {TalkPerson christoph. TalkPerson marcel}
	
		"messages := TalkInbox squeakDev messages sorted: #date descending.
		messages := messages select: [:ea | ea date year >= 2015].
		authors := (messages collect: [:ea | ea author]) as: Bag.
		messagesByAuthor := authors asSet
			collect: [:author | author -> (messages select: [:ea | ea author = author])]
			as: Dictionary.
		messagesByAuthor := (messagesByAuthor associations
			select: [:assoc | ((messagesByAuthor at: assoc key) collect: #date) min <= (DateAndTime now - (2 * 12 * 30) days) and: [((messagesByAuthor at: assoc key) collect: #date) max >= (DateAndTime now - (3 * 30) days)]])
			as: Dictionary.
		authors := authors select: [:author | messagesByAuthor includesKey: author].
		authorCounts := authors sortedCounts collect: [:assoc | assoc value -> assoc key] as: OrderedDictionary.
		(((authorCounts keys take: 100)
			collect: [:author |
				author -> ( ( ((messages
					select: [:ea | ea author = author])
					pairsCollect: [:a :b | a date - b date])
						sorted: #yourself descending)
						first: 5)
					]
			as: OrderedDictionary)
				sorted: [:assoc | assoc value first] ascending)
					associations collect: [:assoc | assoc key -> {assoc value. authorCounts at: assoc key. (messages select: [:ea | ea author = assoc key] thenCollect: #date) minMax}] as: OrderedDictionary"