accessing
mockMessage2

	^ self patch: TalkMessage new withAllValues: (JsonObject new
		dataKey: #mockMessage2;
		inbox: self mockInbox;
		subject: 'mock subject 2';
		author: 'mock author 2';
		date: (DateAndTime fromString: '2021-07-22T21:00');
		text: 'Mock text 2';
		plainText: 'Mock text 2';
		yourself)