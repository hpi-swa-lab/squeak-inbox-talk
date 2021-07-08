tests - enumerating
testGroupByAsOf

	| collection expectedGroups groups |
	collection := #(1 2 3 4 5 6 7 8 9 10).
	expectedGroups := OrderedDictionary new
		at: $o put: (Set with: 1);
		at: $t put: (Set withAll: {2. 3. 10});
		at: $f put: (Set withAll: {4. 5});
		at: $s put: (Set withAll: {6. 7});
		at: $e put: (Set with: 8);
		at: $n put: (Set with: 9);
		yourself.
	
	groups := collection talkGroupBy: [:ea | ea asWords first] as: OrderedDictionary of: Set.
	
	self assert: expectedGroups equals: groups.
	
	self assert: (groups isKindOf: OrderedDictionary).
	self assert: (groups allSatisfy: [:group | group isKindOf: Set])