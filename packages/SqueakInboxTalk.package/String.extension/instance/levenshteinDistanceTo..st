*SqueakInboxTalk-Filters-comparing
levenshteinDistanceTo: anotherString
	"distances at: i at: j will hold the Levenshtein distance between the first i characters of the receiver and the first j characters of anotherString."

	| distances |
	distances := Matrix rows: self size columns: anotherString size element: 0.
	
	"source prefixes can be transformed into empty string by dropping all characters"
	1 to: self size do: [:i | distances at: i at: 1 put: i].
	"target prefixes can be reached from empty source prefix by inserting every character"
	1 to: anotherString size do: [:j | distances at: 1 at: j put: j].
	
	2 to: anotherString size do: [:j |
		2 to: self size do: [:i | | deletionCost insertionCost substitutionCost |
			deletionCost := (distances at: i - 1 at: j) + 1.
			insertionCost := (distances at: i at: j - 1) + 1.
			substitutionCost := (distances at: i - 1 at: j - 1) + ((self at: i) = (anotherString at: j) ifTrue: [0] ifFalse: [1]).
			distances at: i at: j put: ((deletionCost min: insertionCost) min: substitutionCost)]].
	
	^ distances at: self size at: anotherString size