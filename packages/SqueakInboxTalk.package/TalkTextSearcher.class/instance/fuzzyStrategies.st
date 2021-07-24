constants
fuzzyStrategies
	"Comparative observations:
	- BITAP - 7 sec, does not detect added/removed chars - 'proces-faitfhul debugging' not found
	- LEVENSHTEIN - 54 sec
	- NGRAMS - 51 sec
	- SOUNDEX - 13 sec, way too imprecise - 'process' sounds like 'project', 'baloon' like 'boolean'"

	^ #(#bitap #levenshtein #nGram #soundex)