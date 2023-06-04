accessing
mockMessage1

	^ self patch: TalkMessage new withAllValues: (JsonObject new
		dataKey: #mockMessage1;
		inbox: self mockInbox;
		subject: 'mock subject 1';
		author: 'mock author 1';
		date: (DateAndTime fromString: '2021-07-22T20:59');
		text: 'Mock text 1';
		plainText: 'Mock text 1';
		yourself)