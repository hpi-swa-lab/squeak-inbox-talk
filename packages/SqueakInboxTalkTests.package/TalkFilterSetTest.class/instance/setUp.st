running
setUp

	super setUp.
	
	foo := self patch: TalkFilter basicNew at: #accepts: with: [:this :each | self testFoo: each].
	bar := self patch: TalkFilter basicNew at: #accepts: with: [:this :each | self testBar: each].
	{foo. bar} do: [:eachFilter |
		self
			patch: eachFilter at: #isActive withValue: true;
			patch: eachFilter at: #worstCaseCostFor: withValue: 0].
	
	filter := self classUnderTest new.
	filter filters: {foo. bar}.
	
	conversations := (0 to: 12) collect: [:ea | self patchNewAt: #number withValue: ea]