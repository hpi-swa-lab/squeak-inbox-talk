*SqueakInboxTalk-Filters-comparing
matchesLevenshtein: anotherString maxDistance: maxDistance

	^ (self levenshteinDistanceTo: anotherString) <= maxDistance