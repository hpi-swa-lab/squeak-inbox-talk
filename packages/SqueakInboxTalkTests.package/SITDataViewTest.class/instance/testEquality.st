tests
testEquality

	| first second firstKey secondKey |
	first := self classUnderTest new.
	second := self classUnderTest new.
	firstKey := first dataKey.
	secondKey := first dataKey.
	
	self
		patch: first at: #dataKey to: [firstKey, {1}];
		patch: second at: #dataKey to: [secondKey, {1}].
	self assert: first = second.
	self assert: first hash = second hash.
	
	self
		patch: first at: #dataKey to: [firstKey, {1}];
		patch: second at: #dataKey to: [secondKey, {2}].
	self deny: first = second.
	self deny: first hash = second hash.
	
	self patch: first at: #species toValue: self class.
	firstKey := first dataKey.
	self
		patch: first at: #dataKey to: [firstKey, {1}];
		patch: second at: #dataKey to: [secondKey, {1}].
	self deny: first = second.
	self deny: first hash = second hash