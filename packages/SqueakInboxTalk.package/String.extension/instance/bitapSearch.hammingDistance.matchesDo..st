*SqueakInboxTalk-Filters-comparing
bitapSearch: pattern hammingDistance: maxDistance matchesDo: aBlock
	"This is faster than copying the receiver into a non-String."
	^ (self collect: [:char | (char asciiValue between: 1 and: 256) ifTrue: [char] ifFalse: [$?]])
		perform: #bitapSearch:hammingDistance:matchesDo:
		withArguments: {pattern. maxDistance. aBlock}
		inSuperclass: thisContext method methodClass superclass