accessing
mockMessage3

	^ self patch: TalkMessage new withAllValues: (JsonObject new
		dataKey: #mockMessage3;
		inbox: self mockInbox;
		subject: 'mock subject 3';
		author: 'mock author 3';
		date: (DateAndTime fromString: '2021-07-22T21:01');
		text: 'Mock text 3';
		plainText: 'Mock text 3';
		mail: self mockMailObject3;
		yourself)