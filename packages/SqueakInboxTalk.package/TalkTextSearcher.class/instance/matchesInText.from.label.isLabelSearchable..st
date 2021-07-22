matching
matchesInText: aStringOrText from: anObject label: label isLabelSearchable: aBoolean
	"Yield a match instance for every occurence in aStringOrText, decorated with the additional arguments."

	| text |
	self hasComplexTerm ifTrue: [^ self partSearchers talkAsGenerator gather: [:searcher | searcher matchesInText: aStringOrText from: anObject label: label isLabelSearchable: aBoolean]].
	
	text := aStringOrText.
	aBoolean ifTrue: [text := self class decorate: aStringOrText withLabel: label].
	
	^ (self intervalsIn: text asString) collect: [:interval |
		TalkTextSearcherMatch new
			object: anObject;
			key: label;
			label: (aBoolean ifFalse: [label]);
			contents: text;
			interval: interval;
			yourself]