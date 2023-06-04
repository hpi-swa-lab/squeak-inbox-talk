accessing
mockMessage1

	^ self patch: TalkMessage new withAllValues: (JsonObject new
		dataKey: #mockMessage1;
		inbox: self mockInbox;
		subject: 'mock subject 1';
		author: 'mock author 1';
		date: (DateAndTime fromString: '2021-07-22T20:59');
		text: 'Mock *text* 1';
		rawText: 'Content: Mock *text* 1';
		richText: 'Mock <b>text</b> 1' asTextFromHtml;
		plainText: 'Mock *text* 1';
		attachmentNames: #();
		yourself)