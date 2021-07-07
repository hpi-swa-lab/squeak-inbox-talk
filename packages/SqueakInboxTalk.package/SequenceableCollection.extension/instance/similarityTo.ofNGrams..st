*SqueakInboxTalk-Filters-comparing
similarityTo: anotherString ofNGrams: n

	| otherGrams thisGrams |
	thisGrams := self nGrams: n.
	otherGrams := anotherString nGrams: n.
	^ (thisGrams intersection: otherGrams) size * 2 / (thisGrams size + otherGrams size)