*SqueakInboxTalk-Filters-comparing
matches: anotherString ofNGrams: n threshold: aFraction

	^ (self asLowercase similarityTo: anotherString asLowercase ofNGrams: n) >= aFraction