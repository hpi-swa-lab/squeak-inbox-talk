*SqueakInboxTalk-Filters-comparing
matches: anotherString ofNGrams: n threshold: aFraction

	^ (self similarityTo: anotherString ofNGrams: n) >= aFraction