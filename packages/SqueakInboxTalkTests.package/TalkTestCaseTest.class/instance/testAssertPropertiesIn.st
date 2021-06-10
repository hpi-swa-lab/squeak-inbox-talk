tests - asserting
testAssertPropertiesIn

	self
		assertProperties: (OrderedDictionary new
			at: #x put: 3;
			at: #r put: 5;
			at: [:point | point \\ 2] put: 1 @ 0;
			at: #fourNeighbors put: (OrderedCollection new
				add: (Dictionary new
					at: #x put: 4;
					at: #y put: 4;
					yourself);
				add: (Dictionary new
					at: #u put: 3;
					at: #v put: 5;
					yourself);
				add: 2 @ 4;
				add: (Dictionary new
					at: #isPoint put: true;
					yourself);
				yourself);
			yourself)
		in: 3 @ 4